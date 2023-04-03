import 'package:flutter/material.dart';
import '../constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Nouveau Membre ? " : "Déja membre ? ",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            color: kPrimaryWriteColor,
            //fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () => press(),
          child: Text(
            login ? "Inscris toi!" : "Connecte-toi !",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
