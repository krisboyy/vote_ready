import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_ready/pages/level_selector.dart';
import '../widgets/custom_button.dart';

class DataWriter {
  static Future<void> addData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle = TextStyle(fontSize: 130.0.spMin);
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3ED),
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Transform.scale(
                scale: 1.1,
                child: Image.asset(
                  'assets/images/bg_image.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 50.0),
                  Text(
                    'Congratulations',
                    style: GoogleFonts.prompt(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Text(
                    'You have passed all the tests',
                    style: GoogleFonts.ubuntu(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 75.0),
                  Center( // Center the buttons
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Align buttons to the center
                      children: [
                        CustomButton(
                          onPressed: () async {
                            for (int i = 1; i <= 10; i++) {
                              await DataWriter.addData('level$i', 'No');
                            }
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const LevelSelector()),
                              ),
                            );
                          },
                          buttonSize: 15,
                          backgroundColor: const Color(0xFF128807),
                          fontColor: Colors.white,
                          strokeColor: const Color(0xFFFF9933),
                          text: 'Restart',
                          headerStyle: headerStyle,
                        ),
                        SizedBox(width: 20), // Add spacing between buttons
                        CustomButton(
                          onPressed: () async {
                            exit(0);
                          },
                          buttonSize: 15,
                          backgroundColor: const Color(0xFF128807),
                          fontColor: Colors.white,
                          strokeColor: const Color(0xFFFF9933),
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
      ),
    );
  }
}
