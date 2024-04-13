import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataWriter {
  static Future<void> addData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}

class DataReader {
  static Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

class TipsPopup extends StatefulWidget {
  const TipsPopup({Key? key}) : super(key: key);

  @override
  _TipsPopupState createState() => _TipsPopupState();
}

class _TipsPopupState extends State<TipsPopup> {
  final PageController _pageController = PageController(initialPage: 0);
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        isLastPage = _pageController.page?.round() == 2;
      });
    });
  }

  Future<void> _handleNextButton() async {
    if (isLastPage) {
      await DataWriter.addData('TipsOpened', 'Yes');
      Navigator.of(context).pop();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleText = GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
    TextStyle tipText = GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );
    TextStyle buttonText = GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Tips!",
            style: titleText,
          ),
          // const SizedBox(height: 10),
          SizedBox(
            height: 0.3.sh, // Adjust height as needed
            width: 0.9.sh, // Adjust width as needed
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                _buildPage(
                  "Select each level, observe the scenario, and answer the questions correctly",
                  tipText,
                ),
                _buildPage(
                  "Choosing the correct answer will award you with 10 points",
                  tipText,
                ),
                _buildPage(
                  "If you answer anything incorrectly, the app will be locked for 2 minutes",
                  tipText,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (_pageController.page?.round() == _pageController.initialPage) {
              Navigator.of(context).pop();
            } else {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          },
          child: Text(
            'Previous',
            style: buttonText,
          ),
        ),
        TextButton(
          onPressed: _handleNextButton,
          child: Text(
            isLastPage ? 'Close' : 'Next',
            style: buttonText,
          ),
        ),
      ],
    );
  }

  Widget _buildPage(String content, TextStyle textStyle) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Text(
          content,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
