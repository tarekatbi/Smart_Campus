import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/user.dart';
import 'package:todo_app/screens/Home/home_screen.dart';
import 'package:todo_app/screens/Reset_Password/reset_screen.dart';
import 'package:todo_app/screens/Signup/components/or_divider.dart';
import 'package:todo_app/screens/Signup/signup_screen.dart';
import 'package:todo_app/components/already_have_an_account_acheck.dart';
import 'package:todo_app/components/rounded_button.dart';
import 'package:todo_app/components/rounded_input_field.dart';
import 'package:todo_app/components/rounded_password_field.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/services/networking.dart';

class Body2 extends StatefulWidget {
  const Body2({
    Key? key,
  }) : super(key: key);

  @override
  _Body2State createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final idInput = TextEditingController();
    final passwordInput = TextEditingController();

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Text(
              "Vérification",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            //SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/verification.jpg",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Un code à 4 chiffres a été envoyé à tarekatbi@gmail.com. Veuillez entrer le code",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              textController: idInput,
              icon: Icons.domain_verification,
              hintText: "Code",
              onChanged: (val) => {},
            ),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: "Envoyer",
              color: kPrimaryColor,
              press: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetScreen()),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            SizedBox(height: size.height * 0.03),
            Text(
              "© Université d’Oran 1 Ahmed Ben Bella, 2022 Tous droits réservés",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                //fontWeight: FontWeight.bold,
                color: kPrimaryWriteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
