import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/components/bottom_nav_bar.dart';
import 'package:todo_app/screens/Home/components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  void getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: BodyHome(),
      bottomNavigationBar: BottomNavBar(
        activeIndex: 0,
      ),
    );
  }
}
