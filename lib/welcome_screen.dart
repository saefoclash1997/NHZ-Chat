import 'package:flutter/material.dart';
import 'package:nhz_chat/background_decoration.dart';
import 'package:nhz_chat/signin_screen.dart';
import 'package:nhz_chat/signup_screen.dart';

import 'constants.dart';
import 'custom_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
                
                
                tag: "imageHero",
                child: Image.asset("assets/images/app_icon.png", width: 200)),

            DefaultTextStyle(
              style: const TextStyle(fontSize: 20.0, color: Colors.blue),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Welcome to NHZ Chat\nApp",
                    textAlign: TextAlign.center,

                    speed: Duration(milliseconds: 50),
                  ),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(


                  tag: "signInHero",
                  child: CustomButton(title: "Sign In", onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                  }),
                ),
                Hero(


                    tag: "signUpHero",child: CustomButton(
               onPressed: () {
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => SignUpScreen()));
               }
,
                title: "Sign Up")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
