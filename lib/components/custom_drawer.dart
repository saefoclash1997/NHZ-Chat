import 'package:flutter/material.dart';
import 'package:nhz_chat/authentication_services.dart';
import 'package:nhz_chat/constants.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      //  backgroundColor: Colors.white.withOpacity(0.5),
      child: ListView(
        children: [
          CheckboxListTile(
            value: themeProvider.getTheme(),
            onChanged: (val) {
              themeProvider.toggleTheme();
            },
            title: Text(
              "Dark Theme",
              style: TextStyle(color: kDarkBlue2, fontFamily: "times"),
            ),
          ),
          SwitchListTile(
            onChanged: (val) {
              themeProvider.toggleTheme();

            },
            value:               themeProvider.getTheme()
            ,
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
