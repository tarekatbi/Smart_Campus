import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/Profil/changermdp.dart';
import 'package:todo_app/screens/Profil/facultes.dart';
import 'package:todo_app/screens/Profil/infos.dart';
import 'package:todo_app/screens/Profil/components/profile_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../Profs/profs2.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

_launchURLApp() async {
  const url = 'https://www.univ-oran1.dz/index.php/en/';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String BASE_URL = "https://smar-t-campus.herokuapp.com/api";
  bool isLoading = false;
  late String token;

  void disconnectUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final uri = Uri.parse("$BASE_URL/auth/logout");
    final res = await http.post(uri,
        headers: <String, String>{},
        body: <String, String>{'token': prefs.getString('token')!});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF0353A4),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Profil",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          color: Color.fromARGB(255, 215, 215, 215)),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      "assets/icons/edit.svg",
                      color: Color.fromARGB(255, 215, 215, 215),
                      width: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    ProfilePic(),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "ATBI Tarek Yacine",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Color.fromARGB(255, 215, 215, 215)),
                        ),
                        Text(
                          "Etudiant",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Color.fromARGB(255, 215, 215, 215)),
                        ),
                        Text(
                          "Département d'Informatique",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Color.fromARGB(255, 215, 215, 215)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Informations personneles",
            icon: "assets/icons/profile.svg",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Infos()),
              ),
            },
          ),
          ProfileMenu(
            text: "Facultés & Institus",
            icon: "assets/icons/faculté.svg",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Facultes()),
              ),
            },
          ),
          ProfileMenu(
            text: "Télé-Enseignement",
            icon: "assets/icons/e-learning.svg",
            press: () async {
              final url = 'https://elearn.univ-oran1.dz/';
              openBrowserURL(url: url, inApp: true);
            },
          ),
          ProfileMenu(
            text: "Recherche et Doctorat",
            icon: "assets/icons/doctorat.svg",
            press: () async {
              final url = 'https://labos.univ-oran1.dz/';
              openBrowserURL(url: url, inApp: true);
            },
          ),
          ProfileMenu(
            text: "Clubs Scientifique",
            icon: "assets/icons/clubs.svg",
            press: () async {
              final url =
                  'https://vrre.univ-oran1.dz/14-service_vrre/571-clubs-scientifiques.html';
              openBrowserURL(url: url, inApp: true);
            },
          ),
          ProfileMenu(
            text: "E-mail Professeurs",
            icon: "assets/icons/mails.svg",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profs2()),
              ),
            },
          ),
          ProfileMenu(
            text: "Changer le Mot de passe",
            icon: "assets/icons/reset_pass.svg",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Changer()),
              ),
            },
          ),
          ProfileMenu(
            text: "Déconnexion",
            icon: "assets/icons/logout.svg",
            press: () {
              setState(() {});
            },
          ),
        ],
      ),
    ]);
  }
}
