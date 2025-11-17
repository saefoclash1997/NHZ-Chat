import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nhz_chat/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,

            colors: [
            kLightBlue1,
            kDarkBlue2
          ],
          )
        ),

        child: SpinKitSpinningLines(
            lineWidth: 4,
            size: 100,
            color: Colors.white));
  }
}