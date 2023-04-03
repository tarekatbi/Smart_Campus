import 'package:flutter/material.dart';
import 'package:todo_app/screens/Home/components/input_field.dart';
import '../constants.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.passwordController,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  String password = '';
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: widget.passwordController,
        obscureText: !isPasswordVisible,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: "Mot de passe",
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  )
                : Icon(
                    Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
            onPressed: () => setState(() {
              isPasswordVisible = !isPasswordVisible;
            }),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
