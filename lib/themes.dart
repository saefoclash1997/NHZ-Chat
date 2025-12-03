import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  primaryColor: kLightBlue2,
  scaffoldBackgroundColor: kLightBlue1.withOpacity(0.1),

  appBarTheme: AppBarTheme(
    backgroundColor: kLightBlue2,
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.white,
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black87, fontSize: 18, fontFamily: "times"),
    bodyMedium: TextStyle(color: Colors.black87, fontSize: 16, fontFamily: "times"),
    titleLarge: TextStyle(color: kLightBlue2, fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "times"),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: kLightBlue2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: kLightBlue2, width: 2),
    ),
  ),

  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(kLightBlue2),
    trackColor: WidgetStateProperty.all(kLightBlue1),
  ),

  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(Colors.white),
    fillColor: WidgetStateProperty.all(kLightBlue2),
  ),

  iconTheme: IconThemeData(color: kLightBlue2),

  colorScheme: ColorScheme.light(
    primary: kLightBlue2,
    secondary: kLightBlue1,
  ),
);


/// DARK MODE =======================================

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  primaryColor: kDarkBlue2,
  scaffoldBackgroundColor: kDarkBlue1.withOpacity(0.3),

  appBarTheme: AppBarTheme(
    backgroundColor: kDarkBlue2,
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  drawerTheme: DrawerThemeData(
    backgroundColor: kDarkBlue1,
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "times"),
    bodyMedium: TextStyle(color: Colors.white70, fontSize: 16, fontFamily: "times"),
    titleLarge: TextStyle(color: kDarkBlue1, fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "times"),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kDarkBlue2.withOpacity(0.2),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: kDarkBlue2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: kDarkBlue2, width: 2),
    ),
  ),

  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(kDarkBlue2),
    trackColor: WidgetStateProperty.all(kDarkBlue1),
  ),

  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(Colors.white),
    fillColor: WidgetStateProperty.all(kDarkBlue2),
  ),

  iconTheme: IconThemeData(color: Colors.white),

  colorScheme: ColorScheme.dark(
    primary: kDarkBlue2,
    secondary: kDarkBlue1,
  ),
);
