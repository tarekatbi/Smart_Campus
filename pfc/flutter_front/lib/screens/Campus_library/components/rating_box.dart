import 'package:flutter/material.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "4.5",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              )
            ],
          )
        ],
      ),
    );
  }
}
