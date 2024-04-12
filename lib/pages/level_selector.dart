import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vote_ready/components/score_notifier.dart';
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
import 'package:vote_ready/levels/level_11.dart';
import 'package:vote_ready/levels/level_12.dart';
import 'package:vote_ready/levels/level_13.dart';
import 'package:vote_ready/levels/level_14.dart';
import 'package:vote_ready/levels/level_15.dart';
import 'package:vote_ready/levels/level_16.dart';
import 'package:vote_ready/levels/level_17.dart';
import 'package:vote_ready/levels/level_18.dart';
import 'package:vote_ready/levels/level_19.dart';
import 'package:vote_ready/levels/level_20.dart';
import 'package:vote_ready/pages/final_page.dart';
import 'package:vote_ready/pages/home_page.dart';
import '../components/tips_popup.dart';
import '../widgets/custom_button.dart';

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

class LevelSelector extends StatefulWidget {
  const LevelSelector({Key? key}) : super(key: key);

  @override
  State<LevelSelector> createState() => _LevelSelectorState();
}

class _LevelSelectorState extends State<LevelSelector> {
  @override
  void initState() {
    super.initState();
    _initializeData();
    levelSelectorBuilder(0, context);
  }

  Future<void> _initializeData() async {
    String? opened = await DataReader.getData('TipsOpened');
    if (opened != 'Yes') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const TipsPopup();
          },
        );
      });
    }
  }

  Widget levelSelectorBuilder(int i, BuildContext context) {
    int levelNumber = i + 1;
    i++;
    double smallFontSize = 40.0.spMin;
    TextStyle levelStyle = GoogleFonts.fugazOne(
      fontWeight: FontWeight.bold,
      fontSize: smallFontSize,
    );

    return FutureBuilder<bool>(
      future: isLevelCompleted('level$levelNumber'),
      builder: (context, snapshot) {
        bool isCompleted = snapshot.data ?? false;

        Color borderColor = isCompleted ? Colors.green : Colors.black;

        Widget level = Container(
          height: 100.0.spMin,
          width: 100.spMin,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primaryContainer,
            border: Border.all(
              color: borderColor,
              width: 0.2 * smallFontSize,
            ),
          ),
          child: InkWell(
            onTap: () {
              navigateToLevel(levelNumber, context);
            },
            child: Text(
              '$levelNumber',
              style: levelStyle.copyWith(
                color: isCompleted ? Colors.green : Colors.black,
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
    final scoreProvider = Provider.of<ScoreProvider>(context);
    int score = scoreProvider.score;
    Color materialColor = const Color(0xFFFFF1C3);
    double borderRadius = 0.05.sh;
    TextStyle boldStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 50.spMin,
    );
    return WillPopScope(
        onWillPop: () async {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      return true;
    },
    child: Scaffold(
        backgroundColor: const Color(0xFFc49a75),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: 1.1,
              child: Image.asset(
                'assets/images/bg_image.png',
                width: 1.sw,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0.35.sw,
              top: 0,
              child: Container(
                width: 0.3.sw,
                height: 0.13.sh,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: materialColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(borderRadius),
                    bottomRight: Radius.circular(borderRadius),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 0.01.sw,
                ),
                child: RotatedBox(
                  quarterTurns: 0,
                  child: Text(
                    "Level Selector",
                    textAlign: TextAlign.center,
                    style: boldStyle.copyWith(fontSize: 24),
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  20,
                      (index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 60.0.spMin, horizontal: 10.0.spMin),
                    child: levelSelectorBuilder(index, context),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0.01.sw,
              top: 0.01.sw,
              child: Container(
                width: 0.25.sw,
                height: 0.1.sh,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: materialColor,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onBackground,
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius),
                    bottomLeft: Radius.circular(borderRadius),
                    bottomRight: Radius.circular(borderRadius),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 0.01.sw,
                ),
                child: RotatedBox(
                  quarterTurns: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/star.png"),
                      Text(
                        "Score = $score",
                        textAlign: TextAlign.center,
                        style: boldStyle.copyWith(fontSize: 23),
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ],
                  ),
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
                      radius: 30,
                      backgroundColor: const Color(0xFFFFF1C3),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FinalPage()),
                          );
                        },
                        icon: const Icon(
                          Icons.exit_to_app,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            const BackForLvl(),
          ],
        ),
    ),
    );
  }
}

Future<bool> areAllLevelsCompleted() async {
  bool allLevelsCompleted = true;
  for (int i = 1; i <= 20; i++) {
    bool completed = await isLevelCompleted('level$i');
    if (!completed) {
      allLevelsCompleted = false;
      break;
    }
  }
  return allLevelsCompleted;
}

Future<void> navigateToLevel(int levelNumber, BuildContext context) async {
  bool allLevelsCompleted = await areAllLevelsCompleted();
  if (allLevelsCompleted) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FinalPage()),
    );
    return;
  }

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
        MaterialPageRoute(builder: (context) => const Level11()),
      );
      break;
    case 12:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level12()),
      );
      break;
    case 13:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level13()),
      );
      break;
    case 14:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level14()),
      );
      break;
    case 15:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level15()),
      );
      break;
    case 16:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level16()),
      );
      break;
    case 17:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level17()),
      );
      break;
    case 18:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level18()),
      );
      break;
    case 19:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level19()),
      );
      break;
    case 20:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Level20()),
      );
      break;
    case 21:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LevelSelector()),
      );
      break;
    default:
      print('Level $levelNumber not implemented yet');
  }
}