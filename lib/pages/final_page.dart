import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_ready/components/score_notifier.dart';
import 'package:vote_ready/pages/level_selector.dart';
import '../widgets/custom_button.dart';

class DataWriter {
  static Future<void> addData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> addDataScore(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }
}

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle = GoogleFonts.poppins(
      fontSize: 130.0.spMin,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
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
                color: Colors.amber[50],
                colorBlendMode: BlendMode.hardLight,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // const SizedBox(height: 50.0),
                Text(
                  'Congratulations!',
                  style: GoogleFonts.fugazOne(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                    color: Colors.deepOrange,
                  ),
                ),
                Text(
                  'You have passed all the tests',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                // const SizedBox(height: 75.0),
                Center(
                  // Center the buttons
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Align buttons to the center
                    children: [
                      CustomButton(
                        onPressed: () async {
                          for (int i = 1; i <= 20; i++) {
                            await DataWriter.addData('level$i', 'No');
                          }
                          await DataWriter.addDataScore('ScoreSP', 0);
                          Provider.of<ScoreProvider>(
                            context,
                            listen: false,
                          ).updateScore(0);
                          Navigator.popUntil(
                            context,
                            ModalRoute.withName("LevelSelector"),
                          );
                        },
                        buttonSize: 15,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        fontColor: Theme.of(context).colorScheme.onSurface,
                        strokeColor: Colors.transparent,
                        text: 'Restart',
                        headerStyle: headerStyle,
                      ),
                      const SizedBox(width: 20), // Add spacing between buttons
                      CustomButton(
                        onPressed: () async {
                          exit(0);
                        },
                        buttonSize: 15,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        fontColor: Theme.of(context).colorScheme.onSurface,
                        strokeColor: Colors.transparent,
                        text: 'Exit',
                        headerStyle: headerStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
