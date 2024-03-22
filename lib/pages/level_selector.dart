import 'package:flutter/material.dart';
import 'package:vote_ready/constants.dart' as constants;
import 'package:vote_ready/levels/level_01.dart';

class LevelSelector extends StatefulWidget {
  const LevelSelector({super.key});

  @override
  State<LevelSelector> createState() => _LevelSelectorState();
}

class _LevelSelectorState extends State<LevelSelector> {
  Widget levelSelectorBuilder(int i, BuildContext context) {
    i++;
    double smallFontSize = constants.Constants.smallFontSize;
    TextStyle levelStyle = TextStyle(
      fontSize: smallFontSize,
      fontFamily: 'Fugaz One',
      color: Colors.black,
    );
    Widget level = Container(
      width: 0.17 * constants.Constants.screenWidth,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 0.1 * smallFontSize,
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
