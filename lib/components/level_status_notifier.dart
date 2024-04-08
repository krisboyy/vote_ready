import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelCompletionNotifier extends ChangeNotifier {
  Map<String, String?> _completionMap = {};

  Future<bool> isLevelCompleted(String levelKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final levelStatus = prefs.getString(levelKey) == "Yes";
    return levelStatus;
    // return _completionMap[levelKey] == "Yes";
  }

  void setLevelCompleted(String levelKey, String completed) {
    _completionMap[levelKey] = completed;
    notifyListeners();
  }
}
