import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  bool _isDarkTheme = false;

  bool getTheme ()=> _isDarkTheme;

  toggleTheme(){
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

}