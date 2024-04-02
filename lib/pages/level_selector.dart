import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_ready/pages/final_page.dart';

import '../widgets/custom_button.dart';

int score=0;
class DataReader {
  static Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<int?> getScoreSP(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }
}

Future<bool> isLevelCompleted(String levelKey) async {
  String? value = await DataReader.getData(levelKey);
  return value == 'Yes';
}

class LevelSelector extends StatelessWidget {
  const LevelSelector({Key? key}) : super(key: key);

  Widget levelSelectorBuilder(int i, BuildContext context) {
    int levelNumber = i + 1;
    i++;
    double smallFontSize = 40.0.spMin;
    TextStyle levelStyle = GoogleFonts.fugazOne(
      fontWeight: FontWeight.bold,
      fontSize: smallFontSize,
    );
    Color borderColor = Colors.black; // Default border color

    return FutureBuilder<bool>(
      future: isLevelCompleted('level$levelNumber'),
      builder: (context, snapshot) {
        bool isCompleted =
            snapshot.data ?? false; // Default to false if data is null
        borderColor =
        isCompleted ? Colors.green : Colors.black; // Set border color

        Widget level = Container(
          height: 100.0.spMin,
          width: 100.spMin,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: borderColor, // Use dynamic border color
              width: 0.2 * smallFontSize,
            ),
          ),
          child: InkWell(
            onTap: () {
              navigateToLevel(levelNumber, context); // Pass context here
            },
            child: Text(
              '$levelNumber',
              style: levelStyle.copyWith(
                color:
                isCompleted ? Colors.green : Colors.black, // Set text color
              ),
            ),
          ),
        );

        if (levelNumber % 2 == 0) {
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
      },
    );
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
                    (index) =>
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 60.0.spMin, horizontal: 10.0.spMin),
                      child: levelSelectorBuilder(index, context),
                    ),
              ),
            ),
          ),

          Positioned(
            top: -3.spMax,
            right: 10.spMax,
            child: IconButton(
              onPressed: () async {
                exit(0);
              },
              icon: const Icon(
                  Icons.power_settings_new_outlined, color: Colors.black),
            ),
          ),

          Positioned(
            top: 1.spMax,
            right: 50.spMax,
            child: Text(
              "Score = ${score}",
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),

          Positioned(
            top: 5.spMax,
            left: 15.spMax,
            child: Text(
              'Level Selector',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),

          Positioned(
            bottom: 10.spMax,
            right: 10.spMax,
            child: FutureBuilder<bool>(
              future: areAllLevelsCompleted(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!) {
                  return CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FinalPage()),
                        );
                      },
                      icon: const Icon(Icons.exit_to_app, color: Colors.red),
                    ),
                  );
                } else {
                  return SizedBox(); // Return an empty SizedBox if not all levels are completed
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> areAllLevelsCompleted() async {
    bool allLevelsCompleted = true;
    for (int i = 1; i <= 10; i++) {
      bool completed = await isLevelCompleted('level$i');
      if (!completed) {
        allLevelsCompleted = false;
        break;
      }
    }
    return allLevelsCompleted;
  }
}

Future<void> navigateToLevel(int levelNumber, BuildContext context) async {
  Future<bool> isLevelCompleted(String levelKey) async {
    String? value = await DataReader.getData(levelKey);
    return value == 'Yes';
  }
  // Check if all levels are completed
  bool allLevelsCompleted = true;
  for (int i = 1; i <= 10; i++) {
    bool completed = await isLevelCompleted('level$i');
    if (!completed) {
      allLevelsCompleted = false;
      break;
    }
  }
  // If all levels are completed, go to the final page
  if (allLevelsCompleted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const FinalPage()),
    );
    return;
  }

  // If not, navigate to the corresponding level
  switch (levelNumber) {
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level01()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level02()),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level03()),
      );
      break;
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level04()),
      );
      break;
    case 5:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level05()),
      );
      break;
    case 6:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level06()),
      );
      break;
    case 7:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level07()),
      );
      break;
    case 8:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level08()),
      );
      break;
    case 9:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level09()),
      );
      break;
    case 10:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level10()),
      );
      break;
    case 11:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LevelSelector()),
      );
      break;
    default:
      print('Level $levelNumber not implemented yet');
  }
}
