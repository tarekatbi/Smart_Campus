import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/Campus_library/campus_library.dart';
import 'package:todo_app/screens/Home/home_screen.dart';
import 'package:todo_app/screens/Profil/profile_screen.dart';

import '../screens/Campus_map/campus_map.dart';

class BottomNavBar extends StatelessWidget {
  final int activeIndex;
  BottomNavBar({Key? key, required this.activeIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      unselectedFontSize: 10,
      selectedFontSize: 13,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kPrimaryLightColor,
      currentIndex: activeIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.import_contacts),
          label: 'Bibliothèque',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.place,
          ),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Compte',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
            break;

          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CampusLibrary()));
            break;
          case 2:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CampusMap()));
            break;

          case 3:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
            break;

          default:
        }
      },
    );
  }
}
