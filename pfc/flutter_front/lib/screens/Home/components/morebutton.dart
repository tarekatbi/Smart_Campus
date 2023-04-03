import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class MoreButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const MoreButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.only(top: 10),
        // width: 80,
        // height: 40,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   color: buttonColor,
        // ),
        child: Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: buttonColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            )),
      ),
    );
  }
}
