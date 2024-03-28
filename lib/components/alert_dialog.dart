import 'package:flutter/material.dart';
import 'result.dart';

void showQuestionPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'A voter has complained that the VVPAT displayed the wrong symbol. What action should you take?',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Handle other options as needed
                  // For example, show different WrongAnswerPage with correct answers
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RightAnswerPage(
                        correctAnswer: 'Conduct a Test Vote',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Conduct a Test Vote',
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Handle other options as needed
                  // For example, show different WrongAnswerPage with correct answers
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WrongAnswerPage(
                        correctAnswer: 'Conduct a Test Vote',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Ignore the complaint',
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Handle other options as needed
                  // For example, show different WrongAnswerPage with correct answers
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WrongAnswerPage(
                        correctAnswer: 'Conduct a Test Vote',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Replace the VVPAT',
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      );
    },
  );
}
