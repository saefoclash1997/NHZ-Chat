import 'package:flutter/material.dart';
import 'package:nhz_chat/constants.dart';

import '../components/custom_drawer.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Padding(
          padding: const EdgeInsets.all(6.0),
          child: Hero(
            tag: "imageHero",
            child: Image.asset(
              "assets/images/app_icon.png",

            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: kDarkBlue1,
        title: Text("NHZ Chat App"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
          fontFamily: "times"
        ),

      ),
      endDrawer: CustomDrawer(),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                ),
              ),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.send),
              color: Colors.white,

              style: ButtonStyle(

                backgroundColor: WidgetStateProperty.all(kDarkBlue1),
              ),


            )
          ],
        ),
      ),

    );
  }
}
