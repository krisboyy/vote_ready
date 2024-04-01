import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/final_page.dart';
import '../pages/level_selector.dart';
import '../widgets/custom_button.dart';

class DataWriter {
  static Future<void> addData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}

class RightAnswerPage extends StatefulWidget {
  final String correctAnswer;
  final String reason;
  final String details;
  final int level;

  const RightAnswerPage({
    Key? key,
    required this.correctAnswer,
    required this.reason,
    required this.details,
    required this.level,
  }) : super(key: key);

  @override
  _RightAnswerPageState createState() => _RightAnswerPageState();
}

class _RightAnswerPageState extends State<RightAnswerPage> {
  bool _showToTopButton = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 200) {
      setState(() {
        _showToTopButton = true;
      });
    } else {
      setState(() {
        _showToTopButton = false;
      });
    }
  }

  void _scrollToTop() {
    if (_scrollController.offset <= _scrollController.position.minScrollExtent) {
      // If already at the top, scroll downwards
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // If not at the top, scroll to the top
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }


  Future<bool> isLevelCompleted(String levelKey) async {
    String? value = await DataReader.getData(levelKey);
    return value == 'Yes';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              color: Colors.greenAccent,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Congratulations!',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'The answer is correct',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      '👍',
                      style: TextStyle(
                        fontSize: 50.sp,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      widget.reason,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50.h),
                    Text(
                      widget.details,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 48.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await DataWriter.addData('level${widget.level}', 'Yes');
                            // Check if all levels are completed
                            bool allLevelsCompleted = true;
                            for (int i = 1; i <= 10; i++) {
                              bool completed = await isLevelCompleted('level$i');
                              if (!completed) {
                                allLevelsCompleted = false;
                                break;
                              }
                            }

                            // If all levels are completed, go to the final page
                            if (allLevelsCompleted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const FinalPage()),
                              );
                              return;
                            }else{
                              navigateToLevel(widget.level + 1, context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        ElevatedButton(
                          onPressed: () async {
                            await DataWriter.addData('level${widget.level}', 'Yes');                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LevelSelector(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            right: 20.w,
            child: FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Colors.blue,
              child: _showToTopButton ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
            ),
          ),
          Positioned(
            top: 2.spMax,
            right: 2.spMax,
              child: IconButton(
                onPressed: () async {
                  await DataWriter.addData('level${widget.level}', 'Yes');
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LevelSelector()),
                  );
                },
                icon: const Icon(Icons.disabled_by_default, color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}
