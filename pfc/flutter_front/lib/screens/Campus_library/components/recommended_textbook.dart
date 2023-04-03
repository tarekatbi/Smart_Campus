import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/Campus_library/a_book.dart';
import '../../../services/library.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
    required this.textbook,
  }) : super(key: key);
  final Textbook textbook;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 207, 207, 207),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Image.network(
                  textbook.coverImage,
                  alignment: Alignment.bottomLeft,
                )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.textbook.title,
                    softWrap: true,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    this.textbook.authors[0],
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    label: Text("Details"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OneBook(
                                    targetBook: this.textbook,
                                  )));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Kblue)),
                    icon: Icon(Icons.book),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
