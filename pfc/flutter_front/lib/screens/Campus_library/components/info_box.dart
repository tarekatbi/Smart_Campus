import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({Key? key, required this.bigText, required this.smallText})
      : super(key: key);
  final String bigText;
  final String smallText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AutoSizeText(
            this.bigText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
          AutoSizeText(
            this.smallText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 216, 216, 216),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
