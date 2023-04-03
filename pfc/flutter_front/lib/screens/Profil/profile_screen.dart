import 'package:flutter/material.dart';
import 'package:todo_app/components/bottom_nav_bar.dart';
//import 'package:todo_app/screens/Profil/components/body2.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Profile"),
      ),*/
      body: Body(),
      bottomNavigationBar: BottomNavBar(activeIndex: 3),
    );
  }
}
