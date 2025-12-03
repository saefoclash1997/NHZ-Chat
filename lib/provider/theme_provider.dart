import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;

  bool getTheme() => _isDarkTheme;

  ThemeProvider() {
    _loadTheme();  // Load saved theme on startup
  }

  // Load theme from SharedPreferences
  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool("isDarkTheme") ?? false;
    notifyListeners();
  }

  // Toggle + Save
  void toggleTheme() async {
    _isDarkTheme = !_isDarkTheme;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDarkTheme", _isDarkTheme);

    notifyListeners();
  }
}
