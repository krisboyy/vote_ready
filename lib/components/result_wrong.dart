import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/level_selector.dart';
import '../widgets/custom_button.dart';

class WrongAnswerPage extends StatefulWidget {
  final String correctAnswer;
  final String reason;
  final String details;
  final int level;

  const WrongAnswerPage({
    Key? key,
    required this.correctAnswer,
    required this.reason,
    required this.details,
    required this.level,
  }) : super(key: key);

  @override
  _WrongAnswerPageState createState() => _WrongAnswerPageState();
}

class _WrongAnswerPageState extends State<WrongAnswerPage> {
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
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              color: Colors.redAccent,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'Oops! The answer was wrong',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      'The right answer is : ${widget.correctAnswer}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      '👎',
                      style: TextStyle(
                        fontSize: 50.sp,
                      ),
                    ),
                    SizedBox(height: 80.h),
                    Text(
                      widget.reason,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.h),
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
                          onPressed: () {
                            navigateToLevel(widget.level, context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Try Again',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LevelSelector(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Skip This Level',
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
              child: _showToTopButton ? const Icon(Icons.keyboard_arrow_up) : const Icon(Icons.keyboard_arrow_down),
            ),
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: const CustomFAB(), // Add your CustomFAB widget here
          ),
        ],
      ),
    );
  }
}
