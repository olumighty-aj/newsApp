import 'package:flutter/material.dart';
import 'package:newsapp/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  // Method to retrieve text color based on the current theme
  Color getTextColor(BuildContext context) {
    final currentTheme = Theme.of(context).brightness;
    return currentTheme == Brightness.light ? Colors.black : Colors.white;
  }


  void toggleTheme() {
    final isLight = _themeData == ThemeData.light();
    if (isLight) {
      _themeData = ThemeData.dark();
    } else {
      _themeData = ThemeData.light();
    }
    notifyListeners();
  }
}
