import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhz_chat/components/loading_screen.dart';
import 'package:nhz_chat/constants.dart';

import '../components/custom_drawer.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  TextEditingController messageController = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String? myEmail = _firebaseAuth.currentUser!.email;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Hero(
            tag: "imageHero",
            child: Image.asset("assets/images/app_icon.png"),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: kDarkBlue1,
        title: Text("NHZ Chat App"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
          fontFamily: "times",
        ),
      ),
      endDrawer: CustomDrawer(),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: messageController,
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("messages")
                    .doc()
                    .set({
                      "text": messageController.text,
                      "time": DateTime.now(),
                      "senderEmail": FirebaseAuth.instance.currentUser!.email,
                    });
                messageController.clear();
              },
              icon: Icon(Icons.send),
              color: Colors.white,

              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(kDarkBlue1),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("messages").orderBy("time",descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          } else {
            if (!snapshot.hasData ||
                snapshot.data!.size == 0 ||
                snapshot.data == null) {
              return Center(
                child: Text(
                  "No Messages Yet!",
                  style: TextStyle(
                    color: kDarkBlue2,
                    fontSize: 20,
                    fontFamily: "times",
                  ),
                ),
              );
            }else{
              final data = snapshot.data!.docs;

              return ListView.builder(
              reverse: true,
          //     scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(bottom: 80.0,left: 8.0,right: 8.0),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return   Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Align(
                        alignment:  data[index]["senderEmail"] == myEmail! ? AlignmentGeometry.centerRight : AlignmentGeometry.centerLeft ,
                        child: Column(
                   crossAxisAlignment:  data[index]["senderEmail"] == myEmail! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text( data[index]["senderEmail"],
                              style: TextStyle(color: Colors.black45,
                                  fontSize: 9.0,
                                  fontFamily: "times"
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width*4/5

                              ),
                              decoration: BoxDecoration(
                                color:  data[index]["senderEmail"] == myEmail! ?  kDarkBlue2 : Colors.yellow.shade400,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight:  Radius.circular(16),
                                  topLeft:  data[index]["senderEmail"] == myEmail! ? Radius.circular(16) : Radius.circular(0),
                                  topRight: data[index]["senderEmail"] == myEmail! ? Radius.circular(0) : Radius.circular(16),

                                )
                              ),
                                padding: EdgeInsets.all(10),

                              child: Text(data[index]["text"],
                              style: TextStyle(color:  data[index]["senderEmail"] == myEmail! ?  Colors.white : kDarkBlue2,
                                fontFamily: "times"
                              ),

                              ),

                                // child: Column(
                                //   children: [
                                //     Image.network(data[index]["url"]),
                                //     Text(data[index]["text"],
                                //     style: TextStyle(color:  data[index]["senderEmail"] == myEmail! ?  Colors.white : kDarkBlue2,
                                //       fontFamily: "times"
                                //     ),
                                //
                                //     ),
                                //   ],
                                // ),

                            ),
                          ],
                        ),
                      ),
                    );
                  },);
            }
          }
        },
      ),
    );
  }
}
