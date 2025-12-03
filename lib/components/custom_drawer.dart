import 'package:flutter/material.dart';
import 'package:nhz_chat/constants.dart';
import 'package:provider/provider.dart';
import 'package:nhz_chat/authentication/authentication_services.dart';
import '../provider/theme_provider.dart';
import '../screens/api_example/screens/posts_screen.dart';
import '../screens/nav_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


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
            ),
          ),
          ListTile(
            title: Text(
              "Nav Example",

            ),
            leading: Icon(Icons.assistant_navigation,),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainNavbar()));
            },
          ),
          ListTile(
            title: Text(
              "Api Example",

            ),
            leading: Icon(Icons.signal_wifi_connected_no_internet_4_sharp,),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PostsScreen()));
            },
          ),
          ListTile(
            title: Text(
              "Sign Out",

            ),
            leading: Icon(Icons.exit_to_app,),
            onTap: () {
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.rightSlide,
                  title: 'Are you Sure?',
                  btnCancelOnPress: () {},
              btnOkOnPress: () {
              AuthenticationServices().signOut();
              },
              )..show();

            },
          ),
        ],
      ),
    );
  }
}
