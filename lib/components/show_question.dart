import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_ready/components/result_right.dart';
import 'package:vote_ready/components/result_wrong.dart';

import '../pages/level_selector.dart';
import '../widgets/custom_button.dart';

class DataReader {
  static Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

class QuestionPopup {
  static void show(
      BuildContext context,
      String question,
      String crt_ans,
      String option1,
      String option2,
      String option3,
      String reason,
      String details,
      dynamic level,
      ) {
    List<String> options = [
      option1,
      option2,
      option3,
    ];

    // options.shuffle();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white, // Set background color to transparent
          body: Stack( // Use a Stack to overlay the container and the button
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(), // Close dialog on tap outside
                child: Container( // This is the container with the dialog content
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 70.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SingleChildScrollView( // Use SingleChildScrollView to enable scrolling if content overflows
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 25.0),
                        Text(
                          question,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            if (options[0] == crt_ans) {
                              bool completed = await isLevelCompleted('level$level');
                              if(!completed) {
                                score += 10;
                              }
                              await DataWriter.addData('level$level', 'Yes');
                              await DataWriter.addDataScore('ScoreSP', score);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RightAnswerPage(
                                    correctAnswer: crt_ans,
                                    reason: reason,
                                    details: details,
                                    level: level,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WrongAnswerPage(
                                    correctAnswer: crt_ans,
                                    reason: reason,
                                    details: details,
                                    level: level,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            padding: const EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            options[0],
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 18.0),
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            if (options[1] == crt_ans) {
                              bool completed = await isLevelCompleted('level$level');
                              if(!completed) {
                                score += 10;
                              }
                              await DataWriter.addData('level$level', 'Yes');
                              await DataWriter.addDataScore('ScoreSP', score);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RightAnswerPage(
                                    correctAnswer: crt_ans,
                                    reason: reason,
                                    details: details,
                                    level: level,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WrongAnswerPage(
                                    correctAnswer: crt_ans,
                                    reason: reason,
                                    details: details,
                                    level: level,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            padding: const EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            options[1],
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 18.0),
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            if (options[2] == crt_ans) {
                              bool completed = await isLevelCompleted('level$level');
                              if(!completed) {
                                score += 10;
                              }
                              await DataWriter.addData('level$level', 'Yes');
                              await DataWriter.addDataScore('ScoreSP', score);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RightAnswerPage(
                                    correctAnswer: crt_ans,
                                    reason: reason,
                                    details: details,
                                    level: level,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WrongAnswerPage(
                                    correctAnswer: crt_ans,
                                    reason: reason,
                                    details: details,
                                    level: level,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            padding: const EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            options[2],
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 18.0),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned( // Position the button outside the container
                top: 2.spMax,
                right: 2.spMax,
                child: const CustomFAB(), // Your custom button here
              ),
            ],
          ),
        );
      },
    );
  }
}
