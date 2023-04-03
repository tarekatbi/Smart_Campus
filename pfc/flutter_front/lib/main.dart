import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/Campus_library/campus_library.dart';
import 'package:todo_app/screens/Campus_map/campus_map.dart';
import 'package:todo_app/screens/Campus_map/components/loader.dart';
import 'package:todo_app/screens/Home/home_screen.dart';
import 'package:todo_app/screens/Introduction_Screens/onboarding_page.dart';
import 'package:todo_app/screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/Profil/profile_screen.dart';
import 'package:todo_app/screens/Signup/signup_screen.dart';
import 'package:todo_app/services/library.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My campus',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomeScreen());
  }
}
