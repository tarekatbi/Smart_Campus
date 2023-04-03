import 'package:flutter/material.dart';

class MiddleTitle extends StatelessWidget {
  const MiddleTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Text(
          this.title,
          overflow: TextOverflow.fade,
          maxLines: 1,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Color.fromARGB(255, 79, 79, 79),
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ));
  }
}
