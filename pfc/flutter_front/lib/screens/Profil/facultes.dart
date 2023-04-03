import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/bottom_nav_bar.dart';

class Facultes extends StatefulWidget {
  const Facultes({Key? key}) : super(key: key);

  @override
  _FacultesState createState() => _FacultesState();
}

class _FacultesState extends State<Facultes> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Facultés & Institus'),
          backgroundColor: Color(0xFF0353A4),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(activeIndex: 3),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/faculté.svg",
                      width: 25,
                      height: 25,
                      color: Color(0xFF0353A4),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Faculté des sciences exactes & appliquées",
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Color(0xFFF0F0F0),
                    onPrimary: Color(0xFF0A0A0A),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                onPressed: () async {
                  final url = 'https://fsea.univ-oran1.dz/';
                  openBrowserURL(url: url, inApp: true);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/faculté.svg",
                      width: 25,
                      height: 25,
                      color: Color(0xFF0353A4),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Faculté des sciences de la nature et de la vie",
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Color(0xFFF0F0F0),
                    onPrimary: Color(0xFF0A0A0A),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                onPressed: () async {
                  final url = 'https://snv.univ-oran1.dz/';
                  openBrowserURL(url: url, inApp: true);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/faculté.svg",
                      width: 25,
                      height: 25,
                      color: Color(0xFF0353A4),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Faculté de médecine",
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Color(0xFFF0F0F0),
                    onPrimary: Color(0xFF0A0A0A),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                onPressed: () async {
                  final url = 'https://facmed.univ-oran1.dz/';
                  openBrowserURL(url: url, inApp: true);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/faculté.svg",
                      width: 25,
                      height: 25,
                      color: Color(0xFF0353A4),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Faculté des lettres et des arts",
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Color(0xFFF0F0F0),
                    onPrimary: Color(0xFF0A0A0A),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                onPressed: () async {
                  final url = 'https://fla.univ-oran1.dz/';
                  openBrowserURL(url: url, inApp: true);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/faculté.svg",
                      width: 25,
                      height: 25,
                      color: Color(0xFF0353A4),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "Faculté des sciences humaines et sciences islamiques",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Color(0xFFF0F0F0),
                    onPrimary: Color(0xFF0A0A0A),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    )),
                onPressed: () async {
                  final url = 'https://fshsi.univ-oran1.dz/';
                  openBrowserURL(url: url, inApp: true);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/faculté.svg",
                      width: 25,
                      height: 25,
                      color: Color(0xFF0353A4),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "Institut des Sciences et Techniques Appliquées (ISTA)",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Color(0xFFF0F0F0),
                    onPrimary: Color(0xFF0A0A0A),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                onPressed: () async {
                  final url = 'https://ista.univ-oran1.dz/';
                  openBrowserURL(url: url, inApp: true);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/faculté.svg",
                      width: 25,
                      height: 25,
                      color: Color(0xFF0353A4),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    AutoSizeText(
                      "Institut de traduction",
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Color(0xFFF0F0F0),
                    onPrimary: Color(0xFF0A0A0A),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                onPressed: () async {
                  final url = 'https://trad.univ-oran1.dz/';
                  openBrowserURL(url: url, inApp: true);
                },
              ),
            ),
          ],
        ),
      );
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null), // close searchbar
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null); // close searchbar
            } else {
              query = '';
              showSuggestions(context); // back to suggestions
            }
          },
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}

Future openBrowserURL({
  required String url,
  bool inApp = false,
}) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: inApp, // iOS
      forceWebView: inApp, // Android
      enableJavaScript: true, // Android
    );
  }
}
