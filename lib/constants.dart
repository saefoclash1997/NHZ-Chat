import 'package:flutter/material.dart';

Color kLightBlue1 = Colors.blue.shade300;
Color kLightBlue2 = Colors.blue.shade500;
Color kDarkBlue1 = Colors.blue.shade700;
Color kDarkBlue2 = Colors.blue.shade900;

LinearGradient kLightGradient = LinearGradient(
  colors: [kLightBlue1, kLightBlue2],
  begin: AlignmentGeometry.topCenter,
  end: AlignmentGeometry.bottomCenter,
);

LinearGradient kDarkGradient = LinearGradient(
  colors: [kDarkBlue1,kDarkBlue2],
  begin: AlignmentGeometry.topCenter,
  end: AlignmentGeometry.bottomCenter,
);