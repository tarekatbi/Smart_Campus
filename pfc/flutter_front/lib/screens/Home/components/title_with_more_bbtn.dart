import 'package:flutter/material.dart';
import 'package:todo_app/screens/Home/components/morebutton.dart';

import '../../../constants.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          Spacer(),
          MoreButton(
            label: "Voir Tout",
            onTap: press,
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        height: 60,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding / 4),
              child: Text(text,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: introTitle,
                  )),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(right: kDefaultPadding / 4),
                height: 8,
                color: introButton.withOpacity(0.2),
              ),
            )
          ],
        ));
  }
}
