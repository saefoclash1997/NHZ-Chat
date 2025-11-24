import 'package:flutter/material.dart';
import 'package:nhz_chat/authentication_services.dart';
import 'package:nhz_chat/components/background_decoration.dart';
import 'package:nhz_chat/components/fade_animation.dart';
import 'package:nhz_chat/components/loading_screen.dart';
import 'package:nhz_chat/screens/chat_screen.dart';
import '../components/custom_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;

  AuthenticationServices  authenticationServices = AuthenticationServices();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  signUp(BuildContext context) async {

    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
    String? user = await  authenticationServices.signUp(emailController.text.trim(), passwordController.text.trim());
    if(user == null){
      setState(() {
        isLoading = false;
      });
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ChatScreen()), (route) => false,);
    }else{
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(user),

        ),
      );

    }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingScreen() :  Scaffold(
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
                      signUp(context);
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
