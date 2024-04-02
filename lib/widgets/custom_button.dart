import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vote_ready/pages/level_selector.dart';

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

class CustomFAB extends StatelessWidget {
  const CustomFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 2.spMax,
      right: 2.spMax,
        child: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LevelSelector(),
              ),
            );
          },
          icon: const Icon(Icons.disabled_by_default, color: Colors.black),
        ),
    );
  }
}
// class Score extends StatelessWidget {
//   int score;
//
//   Score(int score,{
//     super.key,
//     required this.score,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 1.spMax,
//       right: 30.spMax,
//       child: Text(
//         'Score = ${score}',
//         style: TextStyle(
//           fontSize: 10.sp,
//           fontWeight: FontWeight.w900,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }