
//Custom Widget for Stroke Font, You can add more params if required.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StrokeFont extends StatelessWidget {
  const StrokeFont(
      {super.key,
      required this.headerStyle,
      required this.text,
      required this.fontColor});

  final TextStyle headerStyle;
  final String text;
  final Color fontColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: headerStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3.spMax
              ..color = Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          text,
          style: headerStyle.copyWith(
            color: fontColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}