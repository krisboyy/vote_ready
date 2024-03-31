import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vote_ready/levels/level_01.dart';
import 'package:vote_ready/levels/level_02.dart';
import 'package:vote_ready/levels/level_03.dart';
import 'package:vote_ready/levels/level_04.dart';
import 'package:vote_ready/levels/level_05.dart';
import 'package:vote_ready/levels/level_06.dart';
import 'package:vote_ready/levels/level_07.dart';
import 'package:vote_ready/levels/level_08.dart';
import 'package:vote_ready/levels/level_09.dart';
import 'package:vote_ready/levels/level_10.dart';
import 'package:vote_ready/pages/final_page.dart';

class LevelSelector extends StatelessWidget {
  const LevelSelector({super.key});
  Widget levelSelectorBuilder(int i, BuildContext context) {
    int levelNumber = i + 1;
    i++;
    double smallFontSize = 40.0.spMin;
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
        onTap: () {
          navigateToLevel(levelNumber, context); // Pass context here
        },
        child: Text(
          '$levelNumber',
          style: levelStyle,
        ),
      ),
    );
    if (levelNumber % 2 != 0) {
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

void navigateToLevel(int levelNumber, BuildContext context) {
  switch (levelNumber) {
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Level01()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Level02()),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Level03()),
      );
      break;
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Level04()),
      );
      break;
    case 5:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Level05()),
      );
      break;
    case 6:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Level06()),
      );
      break;
    case 7:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Level07()),
      );
      break;
    case 8:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Level08()),
      );
      break;
    case 9:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Level09()),
      );
      break;
    case 10:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Level10()),
      );
      break;
    case 11:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FinalPage()),
      );
      break;
  // Add cases for other levels as needed
    default:
      print('Level $levelNumber not implemented yet');
  }
}
