import 'package:flutter/material.dart';
import 'package:vote_ready/constants.dart' as constants;
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
class LevelSelector extends StatefulWidget {
  const LevelSelector({Key? key});

  @override
  State<LevelSelector> createState() => _LevelSelectorState();
}

class _LevelSelectorState extends State<LevelSelector> {
  Widget levelSelectorBuilder(int i, BuildContext context) {
    int levelNumber = i + 1;
    double smallFontSize = constants.Constants.smallFontSize;
    TextStyle levelStyle = TextStyle(
      fontSize: smallFontSize,
      color: Colors.black,
    );
    Widget level = Container(
      height: 0.10 * constants.Constants.screenWidth,
      width: 0.2 * constants.Constants.screenWidth,
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
        children: [
          SizedBox(
            height: constants.Constants.screenHeight * 0.4,
          ),
          level,
        ],
      );
    } else {
      return Column(
        children: [
          level,
          SizedBox(
            height: constants.Constants.screenHeight * 0.4,
          ),
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
          SizedBox(
            width: 5 * constants.Constants.screenWidth,
            child: Image.asset(
              'assets/images/bg_image.png',
              fit: BoxFit.contain,
              height: constants.Constants.screenWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.2 * constants.Constants.screenHeight),
            child: ListView.builder(
              itemBuilder: (context, i) {
                return levelSelectorBuilder(i, context);
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          )
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
  // Add cases for other levels as needed
    default:
      print('Level $levelNumber not implemented yet');
  }
}
