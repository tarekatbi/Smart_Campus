import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/components/rounded_button.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/Login/components/body.dart';
import 'package:todo_app/screens/Login/login_screen.dart';
import 'package:todo_app/screens/Signup/signup_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isStudent = true;
  bool isGuest = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff61baff), Color(0xffa6effd)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/images/ebook.png',
              //   width: 100,
              //   height: 100,
              // ),
              SizedBox(
                height: 35,
              ),
              AutoSizeText(
                "Vous êtes",
                style: TextStyle(
                  color: introTitle,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isStudent = !isStudent;
                        isGuest = !isGuest;
                      });
                    },
                    child: Card(
                      color: introBg,
                      margin: EdgeInsets.all(10),
                      elevation: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/student.svg",
                              width: 100,
                              height: 100,
                              color: isStudent ? introTitle : introIcon,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Etudiant",
                              style: TextStyle(
                                fontSize: 22,
                                color: isStudent ? introTitle : introIcon,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isStudent = !isStudent;
                        isGuest = !isGuest;
                      });
                    },
                    child: Card(
                      color: introBg,
                      margin: EdgeInsets.all(10),
                      elevation: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/invite.svg",
                              width: 100,
                              height: 100,
                              color: isGuest ? introTitle : introIcon,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Invité",
                              style: TextStyle(
                                fontSize: 22,
                                color: isGuest ? introTitle : introIcon,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              AutoSizeText(
                "Veuillez choisir",
                style: TextStyle(
                  color: introTitle,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RoundedButton(
                  text: "Continuer",
                  color: introTitle,
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              isGuest ? SignUpScreen() : LoginScreen()))),
            ],
          ),
        ),
      ),
    );
  }
}
