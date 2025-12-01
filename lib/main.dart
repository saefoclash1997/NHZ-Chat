import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nhz_chat/provider/theme_provider.dart';
import 'package:nhz_chat/screens/on_boarding_screen.dart';
import 'package:nhz_chat/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'authentication_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool firstRun = false;

  checkFirstRun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstRun = prefs.getBool("firstRun") ?? false;
    });
    prefs.setBool("firstRun", true);
  }

  @override
  void initState() {
    checkFirstRun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],

      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          theme: themeProvider.getTheme()
              ? lightTheme
              : darkTheme,
          debugShowCheckedModeBanner: false,
          home: firstRun ? AuthenticationWrapper() : OnBoardingScreen(),
        );
      },
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => ThemeProvider()),
  //     ],
  //     child: Consumer<ThemeProvider>(
  //       builder: (context, themeProvider, child) {
  //         return MaterialApp(
  //           theme: themeProvider.getTheme()
  //               ? ThemeData.light()
  //               : ThemeData.dark(),
  //           debugShowCheckedModeBanner: false,
  //           home: firstRun ? AuthenticationWrapper() : OnBoardingScreen(),
  //         );
  //       },
  //     ),
  //   );
  // }
}
