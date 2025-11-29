import 'package:flutter/material.dart';
import 'package:nhz_chat/authentication_services.dart';
import 'package:nhz_chat/constants.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //  backgroundColor: Colors.white.withOpacity(0.5),
      child: ListView(
        children: [
          CheckboxListTile(
            value: isChecked,
            onChanged: (val) {
              setState(() {
                isChecked = !isChecked;
              });
            },
            title: Text(
              "Dark Theme",
              style: TextStyle(color: kDarkBlue2, fontFamily: "times"),
            ),
          ),
          SwitchListTile(
            onChanged: (val) {
              setState(() {
                isChecked = !isChecked;
              });
            },
            value: isChecked,
            title: Text(
              "Dark Theme",
              style: TextStyle(color: kDarkBlue2, fontFamily: "times"),
            ),
          ),

          ListTile(
            title: Text(
              "Sign Out",
              style: TextStyle(
                color: kDarkBlue1,
                fontSize: 20,
                fontFamily: "times",
              ),
            ),
            leading: Icon(Icons.exit_to_app, color: kDarkBlue1),
            onTap: () {
              AuthenticationServices().signOut();
            },
          ),
        ],
      ),
    );
  }
}
