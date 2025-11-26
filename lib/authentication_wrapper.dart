import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhz_chat/screens/chat_screen.dart';
import 'package:nhz_chat/screens/welcome_screen.dart';
import 'components/loading_screen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        } else {
          final User? user = snapshot.data;
          if (user == null) {
            return WelcomeScreen();
          } else {
            return ChatScreen();
          }
        }
      },
    );
  }
}
