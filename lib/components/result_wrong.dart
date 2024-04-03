import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_ready/components/timer_popup.dart';

class WrongAnswerPage extends StatefulWidget {
  final String correctAnswer;
  final String reason;
  final String details;
  final int level;

  const WrongAnswerPage({
    super.key,
    required this.correctAnswer,
    required this.reason,
    required this.details,
    required this.level,
  });

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
    if (_scrollController.offset <= _scrollController.position.minScrollExtent) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void LockEnabler() async {
    final currentTime = DateTime.now();
    final unlockTime=currentTime.add(const Duration(minutes: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('unlockTime', unlockTime.toString());
  }

  static Future<String?> getLockData() async {
    String? retval = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey('unlockTime')) {
      retval = prefs.getString('unlockTime');
    }
    return retval;
  }

  @override
  Widget build(BuildContext context) {
    String? value;
    LockEnabler();
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
                        'Oops! The answer is wrong',
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

                      ElevatedButton(
                        onPressed: () async {
                          value = await getLockData();
                          final diff = DateTime.now().difference(DateTime.parse(value!));
                          TwoHourDialog.showTwoHourDialog(context,diff);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Ok',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                          ),
                        ),
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
          ],
        ),
      );
  }
}
