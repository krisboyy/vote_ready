import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Add more params if required like stroke width, button size
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.headerStyle,
    required this.fontColor,
    required this.backgroundColor,
    required this.text,
    required this.strokeColor,
    this.onPressed, required this.buttonSize,
  });

  final TextStyle headerStyle;
  final Color fontColor;
  final Color backgroundColor;
  final String text;
  final Color strokeColor;
  final void Function()? onPressed;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: strokeColor,
            width: 0.8.spMax,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: headerStyle.copyWith(
          color: fontColor,
          fontSize: buttonSize.spMax,
        ),
      ),
    );
  }
}
