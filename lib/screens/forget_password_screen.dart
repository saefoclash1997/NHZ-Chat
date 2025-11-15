import 'package:flutter/material.dart';
import 'package:nhz_chat/components/background_decoration.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/custom_text_form_field.dart';
import '../constants.dart';


class ForgetPasswordScreen extends StatefulWidget {
  String? email;
  ForgetPasswordScreen({
    this.email
});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();


bool isClicked = false;

@override
  void initState() {
  emailController.text = widget.email!;
    super.initState();
  }

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
                  Flexible(
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 30.0, color: Colors.blue),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Forget Password",
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
              SizedBox(height: 8,),

              CustomTextFormField(

                controller: emailController, title: 'Email',

              ),
              SizedBox(height: 8,),

              AnimatedContainer(
                width: isClicked ? 200: 100,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    borderRadius: isClicked ?BorderRadius.circular(25) :  BorderRadius.circular(8),
                    gradient: isClicked ?    LinearGradient(colors: [
                      Colors.green.shade500,Colors.green.shade700
                    ])   : kDarkGradient
                ),
                duration: Duration(
                milliseconds: 500
                ),
                child: MaterialButton(onPressed:
                isClicked ? null :


                    (){
                  setState(() {
                    isClicked = ! isClicked;
                  });
                },
                  shape: RoundedRectangleBorder(
                    borderRadius: isClicked ?BorderRadius.circular(25) :  BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(isClicked ? "Sent" :  "Send",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28
                        ),),
                      isClicked ?      Icon(Icons.check,color: Colors.white,) : Container()
                    ],
                  ),

                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}

