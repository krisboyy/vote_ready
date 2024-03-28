import 'package:flutter/material.dart';

class Constants extends StatelessWidget {
  const Constants({super.key});
  static late double screenWidth;
  static late double screenHeight;
  static late Size gameWorldSize;
  static double bigFontSize = 0.25 * screenHeight;
  static double smallFontSize = 0.09 * screenHeight;
  static TextStyle headerStyle = TextStyle(
    fontSize: bigFontSize,
    fontFamily: 'Fugaz One',
  );

  static void setGameWorldSize(Size worldSize) {
    gameWorldSize = worldSize;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    return const SizedBox();
  }
}
