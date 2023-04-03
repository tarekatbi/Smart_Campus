import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/user.dart';
import 'package:todo_app/screens/Campus_map/campus_map.dart';
import 'package:todo_app/screens/Home/home_screen.dart';
import 'package:todo_app/screens/Reset_Password/forget_screen.dart';
import 'package:todo_app/screens/Signup/components/or_divider.dart';
import 'package:todo_app/screens/Signup/signup_screen.dart';
import 'package:todo_app/components/already_have_an_account_acheck.dart';
import 'package:todo_app/components/rounded_button.dart';
import 'package:todo_app/components/rounded_input_field.dart';
import 'package:todo_app/components/rounded_password_field.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/services/networking.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool errorMessage = false;

  Networking network =
      new Networking(base_url: "https://smar-t-campus.herokuapp.com/api/");
  final TextEditingController idInput = new TextEditingController();
  final TextEditingController passwordInput = new TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void connectUser() async {
      final id = idInput.text;
      final password = passwordInput.text;
      User user = new User(id, password);
      var res = await network.postRequest(user, "auth/login");
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', jsonDecode(res.body)['token']);
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
            msg: '' + data['msg'] + '',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 24, 0, 90),
            textColor: Color.fromARGB(255, 255, 255, 255));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CampusMap()));
      } else {
        setState(() {
          errorMessage = true;
          isLoading = false;
        });
      }
    }

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Text(
              "Connexion à votre Espace étudiant",
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
              "assets/images/login2.png",
              height: size.height * 0.3,
            ),
            //SizedBox(height: size.height * 0.03),
            RoundedInputField(
              textController: idInput,
              hintText: "ID",
              onChanged: (val) => {},
            ),
            RoundedPasswordField(
              passwordController: passwordInput,
              onChanged: (val) => {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetScreen()),
                  ),
                  child: Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              errorMessage ? "Mot de passe incorrect" : " ",
              style: TextStyle(color: Colors.red),
            ),
            isLoading
                ? CircularProgressIndicator()
                : RoundedButton(
                    text: "Connexion",
                    press: () {
                      setState(() {
                        isLoading = true;
                      });
                      connectUser();
                    },
                    color: kPrimaryColor,
                  ),
            SizedBox(height: size.height * 0.01),
            OrDivider(),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            }),
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
