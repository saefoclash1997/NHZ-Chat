import 'package:flutter/material.dart';
import 'package:nhz_chat/components/background_decoration.dart';
import 'package:nhz_chat/screens/signin_screen.dart';
import 'package:nhz_chat/screens/signup_screen.dart';

import '../constants.dart';
import '../components/custom_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset> ? offsetAnimation;
  Animation<double> ? transparentAnimation;

  Animation? colorAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );

    transparentAnimation = Tween<double>(
      end: 1.0,
      begin: 0
    ).animate(_animationController!);
    offsetAnimation = Tween<Offset> (
      begin: Offset(-1, -2),
      end: Offset(0, 0)
    ).animate(_animationController!);

    colorAnimation = ColorTween(
      begin: kDarkBlue2,
      end: Colors.white,
    ).animate(_animationController!);

    _animationController!.forward();
    //
    // _animationController!.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController!.reverse(from: 1);
    //   } else if (status == AnimationStatus.dismissed) {
    //     _animationController!.forward();
    //   }
    // });

    _animationController!.addListener(() {
      setState(() {
        print(colorAnimation!.value);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation!.value,
      body: BackgroundDecoration(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeTransition(
              opacity: transparentAnimation!,
              child: SlideTransition(

                position: offsetAnimation!,
                child: Hero(
                  tag: "imageHero",
                  child: Image.asset("assets/images/app_icon.png", width: 200),
                ),
              ),
            ),

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
                  child: CustomButton(
                    title: "Sign In",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                  ),
                ),
                Hero(
                  tag: "signUpHero",
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    title: "Sign Up",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
