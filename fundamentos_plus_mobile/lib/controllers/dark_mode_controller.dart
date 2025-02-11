import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeController extends ChangeNotifier {
  static DarkModeController instance = DarkModeController();
  final SharedPreferencesAsync _preferencesAsync = SharedPreferencesAsync();
  bool isDartTheme = false;
  void setTheme(bool theme) async {
    isDartTheme = theme;
    notifyListeners();
    await _preferencesAsync.setBool("isDartTheme", isDartTheme);
  }

  void loadSavedTheme() async {
    bool? savedIsDartTheme = await _preferencesAsync.getBool("isDartTheme");
    if (savedIsDartTheme != null) {
      setTheme(savedIsDartTheme);
    }
  }

  ColorScheme getColorScheme() {
    if (isDartTheme) return _getDarkColorScheme();
    return _getLightColorScheme();
  }

  ColorScheme _getLightColorScheme() {
    return ColorScheme.light(
        primary: Colors.deepPurple.shade100,
        onPrimary: Colors.deepPurple.shade100,
        secondary: Colors.grey.shade300,
        onSecondary: Colors.deepPurple.shade100,
        error: Colors.deepPurple.shade100,
        onError: Colors.deepPurple.shade100,
        surface: Colors.white,
        onSurface: Colors.black);
  }

  ColorScheme _getDarkColorScheme() {
    return ColorScheme.dark(
        primary: Colors.deepPurple.shade100, // default
        onPrimary: Colors.deepPurple.shade500, // default
        secondary: const Color.fromARGB(255, 44, 28, 80),
        onSecondary: Colors.deepPurple.shade100, // default
        error: Colors.deepPurple.shade100, // default
        onError: Colors.deepPurple.shade100, // default
        surface: const Color.fromARGB(255, 8, 5, 15), // background color
        onSurface: Colors.white); // text
  }
}

class DefaultColors {
  static Color greenButton = Color.fromARGB(255, 85, 115, 14);
  static Color secondaryGreenButton = Color.fromARGB(255, 142, 184, 44);
  static Color greenText = Color.fromARGB(255, 118, 147, 53);
}
