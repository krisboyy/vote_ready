import 'package:flutter/material.dart';
import 'package:vote_ready/pages/final_page.dart';
import '../pages/level_selector.dart';

class RightAnswerPage extends StatelessWidget {
  final String correctAnswer;
  final String reason;
  final String details;
  final int level;

  const RightAnswerPage({super.key, required this.correctAnswer, required this.reason, required this.details, required this.level});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable the back button and always go back to the home page
        Navigator.of(context).popUntil((route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: Colors.greenAccent, // Set background color
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 1.0),
                const Text(
                  'The answer was correct',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12.0),
                const Text(
                  '👍', // Thumbs up emoji
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  reason,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12.0),
                Text(
                  details,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () async {

                      navigateToLevel(level + 1, context);

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.green, // Set button background color
                    foregroundColor:
                        Colors.greenAccent, // Set button text color
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Go To Next Level',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}

class WrongAnswerPage extends StatelessWidget {
  final String correctAnswer;
  final String reason;
  final String details;
  final int level;

  const WrongAnswerPage({super.key, required this.correctAnswer, required this.reason, required this.details, required this.level});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable the back button and always go back to the home page
        Navigator.of(context).popUntil((route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: Colors.redAccent, // Set background color to redAccent
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Oops! The answer was wrong',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'The right answer is : $correctAnswer',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  '👎', // Thumbs down emoji
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                ),
                Text(
                  reason,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                Text(
                  details,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    navigateToLevel(level, context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blueGrey, // Set button background color
                    foregroundColor:
                        Colors.redAccent, // Set button text color to redAccent
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Try Again',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}
