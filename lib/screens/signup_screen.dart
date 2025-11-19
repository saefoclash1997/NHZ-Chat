import 'package:flutter/material.dart';
import 'package:nhz_chat/components/background_decoration.dart';
import 'package:nhz_chat/components/fade_animation.dart';
import '../components/custom_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  signUp() {
    if (_formKey.currentState!.validate()) {
      print(emailController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    FadeAnimation(
                      delay: 200,
                      child: Image.asset(
                        "assets/images/app_icon.png",
                        width: 100,
                      ),
                    ),

                    SizedBox(width: 12),
                    FadeAnimation(
                      delay: 400,                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 60.0,
                          color: Colors.blue,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              speed: Duration(milliseconds: 50),
                            ),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                FadeAnimation(
                  delay: 600,                   child: CustomTextFormField(
                    controller: emailController,
                    title: 'Email',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 8),

                FadeAnimation(
                  delay: 800,                   child: CustomTextFormField(
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
                ),

                SizedBox(height: 8),
                FadeAnimation(
                  delay: 1000,                   child: CustomTextFormField(
                    controller: confirmPasswordController,
                    title: 'Confirm Password',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Password";
                      } else if (val.length < 6) {
                        return "Weak Password";
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        return "Password didn't match";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 8),

                FadeAnimation(
                  delay: 1200,                       child: CustomButton(
                    title: "Sign Up",
                    onPressed: () {
                      signUp();
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
