import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_ready/components/level_status_notifier.dart';
import 'package:vote_ready/components/result_right.dart';
import 'package:vote_ready/components/result_wrong.dart';
import 'package:vote_ready/components/score_notifier.dart';
import 'package:vote_ready/pages/login_page.dart';
import '../pages/home_page.dart';
import '../pages/level_selector.dart';
import '../widgets/custom_button.dart';

class DataReader {
  static Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

// If you add a level increment the value of n
class QuestionPopup extends StatefulWidget {
  static int n = 20;
  final String crt_ans;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String reason;
  final String details;
  final dynamic level;

  const QuestionPopup({
    super.key,
    required this.crt_ans,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.reason,
    required this.details,
    this.level,
  });
  static void pushLevelStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final db = FirebaseFirestore.instance;
    String? temp;
    List<bool> levelStatus = List<bool>.generate(
      n,
      (_) => false,
      growable: true,
    );
    for (int i = 0; i < n; i++) {
      temp = prefs.getString("level${i + 1}");
      if (temp == "Yes") {
        levelStatus[i] = true;
      } else {
        levelStatus[i] = false;
      }
    }
    db.collection("users").doc(AuthService.user!.email).update({
      'level': levelStatus
    });
  }

  static void show() {}

  @override
  State<QuestionPopup> createState() => _QuestionPopupState();
}

class _QuestionPopupState extends State<QuestionPopup> {
  // options.shuffle();
  @override
  Widget build(BuildContext context) {
    final scoreProvider = Provider.of<ScoreProvider>(context, listen: false);
    final levelProvider = Provider.of<LevelCompletionNotifier>(context, listen: false);
    int score = scoreProvider.score;
    final List<String> options = [
      widget.option1,
      widget.option2,
      widget.option3,
    ];
    TextStyle questionStyle = GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
    TextStyle answerStyle = GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    return WillPopScope(
        onWillPop: () async {
      // Navigate to the home page when the back button is pressed
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      return true; // Return true to prevent the default back button behavior
    },
    child:Scaffold(
      backgroundColor: Colors.white, // Set background color to transparent
      body: Stack(
        // Use a Stack to overlay the container and the button
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(), // Close dialog on tap outside
            child: Container(
              // This is the container with the dialog content
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 70.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                // Use SingleChildScrollView to enable scrolling if content overflows
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 25.0),
                    Text(
                      widget.question,
                      style: questionStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        if (options[0] == widget.crt_ans) {
                          bool completed = await isLevelCompleted('level${widget.level}');
                          if (!completed) {
                            scoreProvider.incrementScore(10);
                            score = scoreProvider.score;
                            await DataWriter.addDataScore('ScoreSP', score);
                          }
                          await DataWriter.addData('level${widget.level}', 'Yes');
                          levelProvider.setLevelCompleted('level${widget.level}', 'Yes');
                          QuestionPopup.pushLevelStatus();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RightAnswerPage(
                                correctAnswer: widget.crt_ans,
                                reason: widget.reason,
                                details: widget.details,
                                level: widget.level,
                              ),
                            ),
                            ModalRoute.withName('LevelSelector'),
                          );
                        } else {
                          QuestionPopup.pushLevelStatus();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WrongAnswerPage(
                                correctAnswer: widget.crt_ans,
                                reason: widget.reason,
                                details: widget.details,
                                level: widget.level,
                              ),
                            ),
                            ModalRoute.withName('LevelSelector'),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.deepOrangeAccent,
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        options[0],
                        style: answerStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        if (options[1] == widget.crt_ans) {
                          bool completed = await isLevelCompleted('level${widget.level}');
                          if (!completed) {
                            scoreProvider.incrementScore(10);
                            score = scoreProvider.score;
                            await DataWriter.addDataScore('ScoreSP', score);
                          }
                          await DataWriter.addData('level${widget.level}', 'Yes');
                          levelProvider.setLevelCompleted('level${widget.level}', 'Yes');
                          QuestionPopup.pushLevelStatus();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RightAnswerPage(
                                correctAnswer: widget.crt_ans,
                                reason: widget.reason,
                                details: widget.details,
                                level: widget.level,
                              ),
                            ),
                            ModalRoute.withName('LevelSelector'),
                          );
                        } else {
                          QuestionPopup.pushLevelStatus();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WrongAnswerPage(
                                correctAnswer: widget.crt_ans,
                                reason: widget.reason,
                                details: widget.details,
                                level: widget.level,
                              ),
                            ),
                            ModalRoute.withName('LevelSelector'),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.deepOrangeAccent,
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        options[1],
                        style: answerStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        if (options[2] == widget.crt_ans) {
                          bool completed = await isLevelCompleted('level${widget.level}');
                          if (!completed) {
                            scoreProvider.incrementScore(10);
                            score = scoreProvider.score;
                            await DataWriter.addDataScore('ScoreSP', score);
                          }
                          await DataWriter.addData('level${widget.level}', 'Yes');
                          levelProvider.setLevelCompleted('level${widget.level}', 'Yes');
                          QuestionPopup.pushLevelStatus();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RightAnswerPage(
                                correctAnswer: widget.crt_ans,
                                reason: widget.reason,
                                details: widget.details,
                                level: widget.level,
                              ),
                            ),
                            ModalRoute.withName('LevelSelector'),
                          );
                        } else {
                          QuestionPopup.pushLevelStatus();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WrongAnswerPage(
                                correctAnswer: widget.crt_ans,
                                reason: widget.reason,
                                details: widget.details,
                                level: widget.level,
                              ),
                            ),
                            ModalRoute.withName('LevelSelector'),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.deepOrangeAccent,
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        options[2],
                        style: answerStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 18.0),
                  ],
                ),
              ),
            ),
          ),
          CustomFAB()
        ],
      ),
    ),
    );
  }
}
