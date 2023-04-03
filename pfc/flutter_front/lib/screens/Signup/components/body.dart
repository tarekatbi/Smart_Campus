import 'package:flutter/material.dart';

import 'package:todo_app/screens/Login/login_screen.dart';
import 'package:todo_app/screens/Signup/components/or_divider.dart';
import 'package:todo_app/screens/Signup/components/social_icon.dart';
import 'package:todo_app/components/already_have_an_account_acheck.dart';
import 'package:todo_app/components/rounded_button.dart';
import 'package:todo_app/components/rounded_input_field.dart';
import 'package:todo_app/components/rounded_password_field.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final matriculeController = TextEditingController();
    final carteController = TextEditingController();
    final cleSecreteController = TextEditingController();
    final passwordController = TextEditingController();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Inscription",
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
              "assets/images/login_register.png",
              height: size.height * 0.25,
            ),
            RoundedInputField(
              textController: carteController,
              icon: Icons.cast_for_education_rounded,
              hintText: "Numéro Carte Etudiant (ID)",
              onChanged: (value) {},
            ),
            RoundedInputField(
              textController: matriculeController,
              hintText: "Matricule BAC",
              onChanged: (value) {},
            ),
            RoundedInputField(
              textController: cleSecreteController,
              icon: Icons.verified_user_rounded,
              hintText: "Clé Secrète",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              passwordController: passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Inscription",
              press: () {},
              color: kPrimaryColor,
            ),
            //SizedBox(height: size.height * 0.03),
            OrDivider(),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
