import 'package:flutter/material.dart';
import 'package:nhz_chat/background_decoration.dart';

import 'constants.dart';
import 'custom_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Hero(


                      tag: "imageHero",child: Image.asset("assets/images/app_icon.png", width: 100)),


                  SizedBox(width: 12),
                  DefaultTextStyle(
                    style: const TextStyle(fontSize: 60.0, color: Colors.blue),
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
                ],
              ),
              SizedBox(height: 8,),

              CustomTextFormField(

                controller: emailController, title: 'Email',

              ),
              SizedBox(height: 8,),

              CustomTextFormField(

                controller: passwordController, title: 'Password',

              ),

              SizedBox(height: 8,),
              CustomTextFormField(

                controller: confirmPasswordController, title: 'Confirm Password',

              ),

              SizedBox(height: 8,),

              Hero(


                tag: "signUpHero",
                child: CustomButton(title: "Sign Up",
                onPressed: (){
                  print(emailController.text.trim());
                },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

