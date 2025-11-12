import 'package:flutter/material.dart';
import 'package:nhz_chat/background_decoration.dart';
import 'package:nhz_chat/custom_text_form_field.dart';
import 'package:nhz_chat/forget_password_screen.dart';

import 'constants.dart';
import 'custom_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              SizedBox(height: 8,),

              CustomTextFormField(

                controller: emailController, title: 'Email',

              ),
              SizedBox(height: 8,),

              CustomTextFormField(

                controller: passwordController, title: 'Password',

              ),

              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
                }, child:
                Text("Forget Password?",
                style: TextStyle(
                  color: kDarkBlue2
                ),
                )

                ),
              ),

              Hero(


                tag: "signInHero",
                child: CustomButton(title: "Sign In",
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
