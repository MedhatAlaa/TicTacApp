import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  bool isSwitched = false;
  ThemeMode tm = ThemeMode.light;

  void themeMode(bool value) {
    isSwitched = value;
    if (isSwitched == false) {
      tm = ThemeMode.light;
    } else {
      tm = ThemeMode.dark;
    }
    notifyListeners();
  }
}
