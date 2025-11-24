import 'package:flutter/material.dart';
import 'package:nhz_chat/authentication_services.dart';
import 'package:nhz_chat/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
    //  backgroundColor: Colors.white.withOpacity(0.5),
      child: ListView(
        children: [
          //TODO: Theme
          ListTile(
            title: Text("Sign Out",
            style: TextStyle(
              color: kDarkBlue1,
              fontSize: 20,
              fontFamily: "times"
            ),


            ),
            leading: Icon(Icons.exit_to_app,
              color: kDarkBlue1,

            ),
            onTap: (){
              AuthenticationServices().signOut();
            },

          ),


        ],
      ),
    );
  }
}
