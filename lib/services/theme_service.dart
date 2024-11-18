import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  //bool isDarkModeOn = false;
  bool isLightModeOn = true;

  void toggleTheme() {
    //isDarkModeOn = !isDarkModeOn;
    isLightModeOn = !isLightModeOn;
    notifyListeners();
  }
}