import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button.dart';

class CreditsPage extends StatefulWidget {
  const CreditsPage({super.key});

  @override
  State<CreditsPage> createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
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

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 24.spMin,
    );
    final TextStyle bodyStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: 20.spMin,
    );

    // double borderRadius = 0.05.sh;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            dragStartBehavior: DragStartBehavior.down,
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 0.1.sh,
                ),
                Image.asset("assets/images/rit.png"),
                SizedBox(
                  height: 0.05.sh,
                ),
                Text(
                  "Developed by the team from Rajiv Gandhi Institute of Technology, Kottayam",
                  style: titleStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Text(
                  "Advisory Team",
                  style: titleStyle.copyWith(decoration: TextDecoration.underline),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Smt. V. Vigneshwari",
                  style: bodyStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "District Collector & District Magistrate\nKottayam, Kerala State",
                  style: bodyStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 0.5.sw,
                      child: Column(
                        children: [
                          Text(
                            "Prof. Shibu Kumar K.B.",
                            style: bodyStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Assistant Professor\nRIT, Kottayam",
                            style: bodyStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 0.5.sw,
                      child: Column(
                        children: [
                          Text(
                            "Prof. Pillai Praveen Thulasidharan",
                            style: bodyStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Assistant Professor\nRIT, Kottayam",
                            style: bodyStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Column(
                  children: [
                    Text(
                      "Dr. John C John",
                      style: bodyStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Associate Professor\nRIT, Kottayam",
                      style: bodyStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Development Team",
                          style: titleStyle.copyWith(decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Aby Pious Vinoy\nArjun C Vinod\nAthira Vijayan\nNikhil Krishnan\nSreeraj K",
                          style: bodyStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Art Team",
                          style: titleStyle.copyWith(decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Dona Johnson\nEaswari Nair\nMegha Joy\nRahul K\n",
                          style: bodyStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.1.sh,
                ),
              ],
            ),
          ),
          const CustomBack(),
          Positioned(
            bottom: 20.h,
            right: 20.w,
            child: FloatingActionButton(
              onPressed: _scrollToTop,
              // backgroundColor: Colors.blue,
              child: _showToTopButton ? const Icon(Icons.keyboard_arrow_up) : const Icon(Icons.keyboard_arrow_down),
            ),
          ),
        ],
      ),
    );
  }
}
