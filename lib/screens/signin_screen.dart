import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhz_chat/components/background_decoration.dart';
import 'package:nhz_chat/components/loading_screen.dart';
import 'package:nhz_chat/screens/chat_screen.dart';
import 'package:nhz_chat/authentication/authentication_services.dart';
import '../components/custom_text_form_field.dart';
import '../constants.dart';
import '../components/custom_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'forget_password_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  AuthenticationServices  authenticationServices = AuthenticationServices();

  final _formKey = GlobalKey<FormState>();

  signIn(BuildContext context) async {

    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      String? user = await  authenticationServices.signIn(emailController.text.trim(), passwordController.text.trim());
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
                    signIn(context);
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
