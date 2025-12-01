import 'package:flutter/material.dart';

import 'constants.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kLightBlue2,
  scaffoldBackgroundColor: kLightBlue1.withOpacity(0.1),
  appBarTheme: AppBarTheme(
    backgroundColor: kLightBlue2,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black87, fontSize: 18),
    bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
    titleLarge: TextStyle(color: kLightBlue2, fontSize: 22, fontWeight: FontWeight.bold),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(kLightBlue2),
    trackColor: WidgetStateProperty.all(kLightBlue1),
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(Colors.white),
    fillColor: WidgetStateProperty.all(kLightBlue2),
  ),
  colorScheme: ColorScheme.light(
    primary: kLightBlue2,
    secondary: kLightBlue1,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kDarkBlue2,
  scaffoldBackgroundColor: kDarkBlue1.withOpacity(0.3),
  appBarTheme: AppBarTheme(
    backgroundColor: kDarkBlue2,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
    bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
    titleLarge: TextStyle(color: kDarkBlue1, fontSize: 22, fontWeight: FontWeight.bold),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(kDarkBlue2),
    trackColor: WidgetStateProperty.all(kDarkBlue1),
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(Colors.white),
    fillColor: WidgetStateProperty.all(kDarkBlue2),
  ),
  colorScheme: ColorScheme.dark(
    primary: kDarkBlue2,
    secondary: kDarkBlue1,
  ),
);
