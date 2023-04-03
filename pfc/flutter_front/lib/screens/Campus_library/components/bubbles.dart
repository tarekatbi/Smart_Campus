import 'package:flutter/material.dart';

class Bubbles extends StatelessWidget {
  const Bubbles(
      {Key? key,
      required this.imageLink,
      required this.resourceNumber,
      required this.textbookString})
      : super(key: key);
  final String imageLink;
  final String resourceNumber;
  final String textbookString;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(this.imageLink),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken))),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                this.resourceNumber,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w900),
              ),
              Container(
                width: 100,
                child: Text(
                  this.textbookString,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )),
    );
  }
}
