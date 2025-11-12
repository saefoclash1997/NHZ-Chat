import 'package:flutter/material.dart';

import '../constants.dart';

class BackgroundDecoration extends StatelessWidget {

 final Widget child;

  const BackgroundDecoration({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height,
      child: Stack(
        children: [



          Positioned(
            right: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width* 0.6,
              height: MediaQuery.of(context).size.width* 0.6,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 2
                  )
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(360)
                ),
                gradient: kLightGradient,
              ),
            ),
          ),
          Positioned(
            child:  Container(
              width: MediaQuery.of(context).size.width* 3/4,
              height: MediaQuery.of(context).size.width* 3/4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 4
                  )
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(360)
                ),
                gradient: kDarkGradient,
              ),
            ),
          ),
          Positioned(
            left: 50,
            bottom: 100.0,
            child: Container(
              width:80,
              height: 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 2
                  )
                ],
                borderRadius: BorderRadius.circular(360.0),
                gradient: kLightGradient,
              ),
            ),
          ),
          Positioned(
            right: 50,
            bottom: 200.0,
            child:  Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 4
                  )
                ],
                borderRadius: BorderRadius.circular(360.0),
                gradient: kDarkGradient,
              ),
            ),
          ),
          Center(
            child: child,
          )
          ,

        ],
      ),
    );
  }
}
