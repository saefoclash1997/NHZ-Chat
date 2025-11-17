import 'package:flutter/material.dart';
import 'package:nhz_chat/components/background_decoration.dart';
import 'package:nhz_chat/components/loading_screen.dart';
import 'package:nhz_chat/screens/chat_screen.dart';
import '../components/custom_text_form_field.dart';
import '../constants.dart';
import '../components/custom_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'forget_password_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  signIn() {
    isLoading = true;
    if (_formKey.currentState!.validate()) {
      print(emailController.text.trim());
    }

    isLoading = false;

  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingScreen() : Scaffold(
      body: Form(
        key: _formKey,
        child: BackgroundDecoration(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: "imageHero",
                      child: Image.asset(
                        "assets/images/app_icon.png",
                        width: 100,
                      ),
                    ),

                    SizedBox(width: 12),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 60.0,
                        color: Colors.blue,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Sign In",
                            textAlign: TextAlign.center,
                            speed: Duration(milliseconds: 50),
                          ),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                CustomTextFormField(
                  controller: emailController,
                  title: 'Email',
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),

                CustomTextFormField(
                  controller: passwordController,
                  title: 'Password',
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Password";
                    } else if (val.length < 6) {
                      return "Weak Password";
                    }
                    return null;
                  },
                ),

                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen(
                            email : emailController.text.trim()
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: kDarkBlue2),
                    ),
                  ),
                ),

                Hero(
                  tag: "signInHero",
                  child: CustomButton(
                    title: "Sign In",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                    //  signIn();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
