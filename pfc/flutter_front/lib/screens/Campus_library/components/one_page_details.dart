import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BackgroundBookCover extends StatelessWidget {
  const BackgroundBookCover({Key? key, required this.imageLink})
      : super(key: key);

  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(this.imageLink),
              fit: BoxFit.cover,
              opacity: .4,
              colorFilter: ColorFilter.mode(
                  Color(0x03016a).withOpacity(0.7), BlendMode.darken))),
      height: 640,
    );
  }
}

class TitleAndAuthor extends StatelessWidget {
  const TitleAndAuthor({Key? key, required this.author, required this.title})
      : super(key: key);
  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          AutoSizeText(
            this.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 255, 255, 255)),
            maxLines: 2,
          ),
          SizedBox(
            height: 5,
          ),
          AutoSizeText(
            this.author,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 217, 217, 217)),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class BookCover extends StatelessWidget {
  const BookCover({Key? key, required this.imageLink}) : super(key: key);
  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 46, 46, 46).withOpacity(0.3),
                offset: Offset(0, 20),
                spreadRadius: 1,
                blurRadius: 20,
                blurStyle: BlurStyle.normal)
          ],
          image: DecorationImage(
              image: NetworkImage(
                this.imageLink,
              ),
              fit: BoxFit.contain)),
    );
  }
}
