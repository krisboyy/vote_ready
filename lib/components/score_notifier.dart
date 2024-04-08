import 'package:flutter/foundation.dart';

class ScoreProvider with ChangeNotifier {
  int _score = 0;

  int get score => _score;

  void incrementScore(int value) {
    _score += value;
    notifyListeners();
  }

  void updateScore(int value) {
    _score = value;
    notifyListeners();
  }
}
