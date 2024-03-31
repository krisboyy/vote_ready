import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vote_ready/levels/level_01.dart';

class LevelSelector extends StatelessWidget {
  const LevelSelector({super.key});

  Widget levelSelectorBuilder(int i, BuildContext context) {
    i++;
    double smallFontSize = 20.0.spMin;
    TextStyle levelStyle = TextStyle(
      fontSize: smallFontSize,
      color: Colors.black,
    );
    Widget level = Container(
      height: 100.0.spMin,
      width: 100.spMin,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 0.2 * smallFontSize,
        ),
      ),
      child: InkWell(
        onTap: (() async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const Level01()),
            ),
          );
        }),
        child: Text(
          '$i',
          style: levelStyle,
        ),
      ),
    );
    if (i % 2 != 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          level,
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          level,
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3ED),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
            scale: 0.5.spMax,
            child: Image.asset(
              'assets/images/bg_image.png',
              fit: BoxFit.contain,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                10,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 60.0.spMin, horizontal: 10.0.spMin),
                  child: levelSelectorBuilder(index, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
