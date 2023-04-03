import 'package:flutter/material.dart';
import 'package:todo_app/components/bottom_nav_bar.dart';
import 'package:todo_app/screens/Profil/components/profile_pic.dart';
//import 'package:todo_app/screens/Profil/components/body2.dart';

import 'components/body.dart';

class Infos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations Personnels'),
        backgroundColor: Color(0xFF0353A4),
      ),
      body: Center(
          child: ListView(children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProfilePic(),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Text(
              "Nom & Prénom",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF919191),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Text(
              "ATBI Tarek Yacine",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF0E0E0E),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Color(0xFFC3C3C3),
          thickness: 1,
          indent: 25,
          endIndent: 25,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Text(
              "ID",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF919191),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Text(
              "1818370155248",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF0E0E0E),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Color(0xFFC3C3C3),
          thickness: 1,
          indent: 25,
          endIndent: 25,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Text(
              "Faculté",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF919191),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Text(
              "Sciences Exactes & Appliquées",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF0E0E0E),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Color(0xFFC3C3C3),
          thickness: 1,
          indent: 25,
          endIndent: 25,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Text(
              "Département",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF919191),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Text(
              "Informatique",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF0E0E0E),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Color(0xFFC3C3C3),
          thickness: 1,
          indent: 25,
          endIndent: 25,
        ),
        SizedBox(
          height: 10,
        ),
      ])),
      bottomNavigationBar: BottomNavBar(activeIndex: 3),
    );
  }
}
