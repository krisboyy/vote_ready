import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_ready/components/score_notifier.dart';
import 'package:vote_ready/pages/level_selector.dart';
import 'package:vote_ready/pages/login_page.dart';
import 'package:vote_ready/pages/profile_page.dart';
import 'package:vote_ready/widgets/page_fonts.dart';
import '../components/timer_popup.dart';
import '../widgets/custom_button.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  static Future<String?> getLockData() async {
    String? retval;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('unlockTime')) {
      retval = prefs.getString('unlockTime');
    }
    return retval;
  }

  @override
  Widget build(BuildContext context) {
    String? value;
    final scoreProvider = Provider.of<ScoreProvider>(context);
    int score;
    TextStyle headerStyle = GoogleFonts.fugazOne(
      fontWeight: FontWeight.bold,
      fontSize: 130.spMin,
    );

    return WillPopScope(
      onWillPop: () async {
        exit(0);
      },
    child: Scaffold(
      backgroundColor: const Color(0xFFF2F3ED),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    StrokeFont(
                      text: 'Vote',
                      headerStyle: headerStyle,
                      fontColor: const Color(0xFFFF9933),
                    ),
                    Positioned(
                      top: 35.spMax,
                      child: StrokeFont(
                        text: 'Ready',
                        headerStyle: headerStyle,
                        fontColor: const Color(0xFF128807),
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  onPressed: () async {
                    value = await getLockData();
                    if (null != value) {
                      final diff = DateTime.now().difference(DateTime.parse(value!));
                      if (diff <= Duration.zero) {
                        TwoHourDialog.showTwoHourDialog(context, diff);
                      } else {
                        score = (await DataReader.getScoreSP('ScoreSP')) ?? 0;
                        scoreProvider.updateScore(score);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            settings: const RouteSettings(name: "LevelSelector"),
                            builder: ((context) => const LevelSelector()),
                          ),
                        );
                      }
                    } else {
                      score = (await DataReader.getScoreSP('ScoreSP')) ?? 0;
                      scoreProvider.updateScore(score);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: const RouteSettings(name: "LevelSelector"),
                          builder: ((context) => const LevelSelector()),
                        ),
                      );
                    }
                  },
                  buttonSize: 15,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  fontColor: Theme.of(context).primaryColor,
                  text: 'Start',
                  strokeColor: Colors.transparent,
                  headerStyle: headerStyle,
                ),
              ],
            ),
            const CustomClose(),
            Positioned(
              top: 10.spMax,
              right: 10.spMax,
              child: Container(
                width: 20.spMax,
                height: 20.spMax,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      width: 0.0025.sw,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(AuthService.user!.photoURL!),
                    )),
                clipBehavior: Clip.none,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
                    );
                  },
                  icon: const SizedBox(),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
