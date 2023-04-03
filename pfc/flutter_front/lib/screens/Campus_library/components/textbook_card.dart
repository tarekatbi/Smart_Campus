import 'package:flutter/material.dart';

class TextbookCard extends StatelessWidget {
  const TextbookCard(
      {Key? key,
      required this.title,
      required this.author,
      required this.imageLink})
      : super(key: key);
  final String title;
  final String author;
  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 180, 180, 180),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                this.imageLink,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Text(
                  this.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.author,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
