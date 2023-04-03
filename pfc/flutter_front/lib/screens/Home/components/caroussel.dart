import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../Profil/facultes.dart';

class Caroussel extends StatelessWidget {
  const Caroussel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      height: 290,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 300,
            child: GestureDetector(
              onTap: () async {
                final url = 'https://www.univ-oran1.dz/edis2022/index.html';
                openBrowserURL(url: url, inApp: true);
              },
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("assets/images/pl.jpg"),
                    ListTile(
                      title: Text("EDIS'2022"),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "3 rd International Conference on Embedded and Distributed Systems (EDiS’2022)",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: 300,
            child: GestureDetector(
              onTap: () async {
                final url =
                    'https://www.univ-oran1.dz/index.php/homepage/actualite/275-3eme-edition-ivar-2022';
                openBrowserURL(url: url, inApp: true);
              },
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("assets/images/ivar.png"),
                    ListTile(
                      title: Text("3ème édition IVAR 2022"),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "La 3ème édition IVAR2022 est dédiée aux thématiques sur les réalités étendues",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            child: Card(
              child: Wrap(
                children: <Widget>[
                  Image.asset("assets/images/pl.jpg"),
                  ListTile(
                    title: Text("PL"),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Faculté des sciences humaines et sciences islamiques ssssssss",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
