import 'package:flutter/material.dart';
import 'package:vote_ready/pages/level_selector.dart';
import 'package:vote_ready/constants.dart' as constants;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenWidth = constants.Constants.screenWidth;
  double screenHeight = constants.Constants.screenHeight;
  double bigFontSize = constants.Constants.bigFontSize;
  double smallFontSize = constants.Constants.smallFontSize;
  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle = TextStyle(
      fontSize: bigFontSize,
      //fontFamily: 'Fugaz One',
    );
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3ED),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/bg_image.png',
                height: 1.1 * screenHeight,
                fit: BoxFit.contain,
              ),
            ),
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Text(
                          "Vote",
                          style: headerStyle.copyWith(
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = .04 * bigFontSize
                              ..color = Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Vote",
                          style: headerStyle.copyWith(
                            color: Color(0xFFFF9933),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Positioned(
                          top: 0.6 * bigFontSize,
                          child: Text(
                            "Ready",
                            style: headerStyle.copyWith(
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = .04 * bigFontSize
                                ..color = Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Positioned(
                          top: 0.6 * bigFontSize,
                          child: Text(
                            "Ready",
                            style: headerStyle.copyWith(
                              color: Color(0xFF128807),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(Color(0xFF128807)),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: const Color(0xFFFF9933),
                            width: smallFontSize * 0.08,
                          ),
                        ),
                      ),
                      onPressed: (() async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const LevelSelector()),
                          ),
                        );
                      }),
                      child: Text(
                        "Start",
                        style: headerStyle.copyWith(
                          color: const Color(0xFFFFFFFF),
                          fontSize: smallFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
