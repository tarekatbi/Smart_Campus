import 'package:flutter/material.dart';

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                  'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1454296875l/25666050.jpg'),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "25 days left",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Taken no : 15/05/2022",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () {},
                      icon: Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Return",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
