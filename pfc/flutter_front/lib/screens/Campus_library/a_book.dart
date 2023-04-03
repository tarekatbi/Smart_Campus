import 'dart:collection';
import 'dart:convert';
import 'package:dart_date/dart_date.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/components/bottom_nav_bar.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/Campus_library/components/info_box.dart';
import 'package:todo_app/screens/Campus_library/components/rating_box.dart';
import '../../services/library.dart';
import '../Campus_map/campus_map.dart';
import 'components/in_loader.dart';
import 'components/one_page_details.dart';
import 'components/recommended_textbook.dart';
import 'components/success_card.dart';

class OneBook extends StatefulWidget {
  const OneBook({Key? key, required this.targetBook}) : super(key: key);
  final Textbook targetBook;

  @override
  State<OneBook> createState() => _OneBookState();
}

class _OneBookState extends State<OneBook> {
  double rate = 0.0;
  LibraryService libraryService = new LibraryService();
  Color btnColor = Kblue;
  bool isBtnActive = true;
  IconData btnIcon = Icons.bookmark;
  String btnTitle = "Réserver ce titre";
  late Future<List<Textbook>> similarbooks;
  bool isReserved = false;
  double currentIn = 0;
  bool hasBeenRated = false;
  String ratingMsg = "Noter cet Ouvrage";
  bool loadingCheckRes = true;
  bool loadingRatingCheck = true;
  @override
  void initState() {
    super.initState();
    _verifyReservation();
    _verifyRating();
    //generate similar books
    similarbooks = libraryService.similarBooks('java');
  }

  void _verifyReservation() async {
    int res = await libraryService.isReserved(widget.targetBook.id);

    if (res == 200) {
      setState(() {
        btnColor = Colors.grey;
        btnTitle = "Déjà réservé";
        isReserved = true;
        loadingCheckRes = false;
      });
    } else if (res == 404) {
      setState(() {
        loadingCheckRes = false;
      });
    }
  }

  void _verifyRating() async {
    Response rateRes = await libraryService.isRated(widget.targetBook.id);
    print("This is the status code " + rateRes.statusCode.toString());
    if (rateRes.statusCode == 200) {
      final data = jsonDecode(rateRes.body);
      final rating = data['rating'].toString() + ".0";
      setState(() {
        hasBeenRated = true;
        rate = double.parse(rating.toString());
        loadingRatingCheck = false;
      });
    } else {
      setState(() {
        loadingRatingCheck = false;
      });
    }
  }

  ///reserve the given textbook
  void reserveTextbook(int textbookId) async {
    final res = await libraryService.reserveBook(textbookId);
    if (res.statusCode == 200) {
      setState(() {
        btnColor = Colors.green;
        btnIcon = Icons.check;
        btnTitle = "Réservé";
      });
    } else if (res.statusCode == 400) {
      setState(() {
        btnColor = Colors.grey;
      });
      Fluttertoast.showToast(
          msg: 'Il ne reste plus de copies de ce titre',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 24, 0, 90),
          textColor: Color.fromARGB(255, 255, 255, 255));
    }
  }

  void rateTextbook(double rate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await libraryService.rateTextbook(
        widget.targetBook.id, rate, prefs.getString('token')!);
    if (response.statusCode == 200) {
      setState(() {
        hasBeenRated = true;
      });
    } else if (response.statusCode == 404) {
      setState(() {
        ratingMsg = "error while rating";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Stack(children: [
          BackgroundBookCover(imageLink: widget.targetBook.coverImage),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, top: 30),
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.west,
                          color: Colors.white,
                          size: 34,
                        ),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.grey),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(0, 0, 0, 0)),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(0, 0, 0, 0)))),
                    Expanded(
                        child: AutoSizeText(
                      widget.targetBook.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      textAlign: TextAlign.center,
                    )),
                    SizedBox(
                      width: 40,
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 310,
                child: Column(
                  children: [
                    BookCover(
                      imageLink: widget.targetBook.coverImage,
                    ),
                    TitleAndAuthor(
                      title: widget.targetBook.title,
                      author: widget.targetBook.authors[0],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                color: Color.fromARGB(6, 189, 189, 189).withOpacity(0.3),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Row(children: [
                  RatingBox(),
                  InfoBox(
                      bigText: widget.targetBook.pageCount.toString(),
                      smallText: "Nbr pages"),
                  InfoBox(bigText: "En", smallText: "Langue")
                ]),
              )
            ],
          )
        ]),
        //informations about the book
        Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: Color.fromARGB(255, 43, 43, 43), width: 3))),
          margin: EdgeInsets.only(top: 20, left: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              AutoSizeText(
                widget.targetBook.description!,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
          child: PhysicalModel(
            color: Colors.white,
            shape: BoxShape.rectangle,
            elevation: 3.5,
            child: loadingRatingCheck
                ? Center(
                    child: InLoader(),
                  )
                : Container(
                    padding: EdgeInsets.all(10),
                    child: hasBeenRated
                        ? SuccessCard(
                            rate: rate,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                ratingMsg,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RatingStars(
                                value: rate,
                                onValueChanged: (v) {
                                  //set the rating
                                  setState(() {
                                    rate = v;
                                  });
                                },
                                starBuilder: (index, color) => Icon(
                                  Icons.star,
                                  color: color,
                                ),
                                starCount: 5,
                                starSize: 22,
                                valueLabelColor:
                                    Color.fromARGB(255, 53, 27, 147),
                                valueLabelTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                valueLabelRadius: 10,
                                maxValue: 5,
                                starSpacing: 2,
                                maxValueVisibility: true,
                                valueLabelVisibility: false,
                                animationDuration: Duration(milliseconds: 1000),
                                valueLabelPadding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 8),
                                valueLabelMargin:
                                    const EdgeInsets.only(right: 8),
                                starOffColor: const Color(0xffe7e8ea),
                                starColor: Colors.yellow,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (rate == 0.0) {
                                    Fluttertoast.showToast(
                                        msg: 'This is toast notification',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor:
                                            Color.fromARGB(255, 24, 0, 90),
                                        textColor:
                                            Color.fromARGB(255, 255, 255, 255));
                                  } else {
                                    rateTextbook(rate);
                                  }
                                },
                                child: Text("Submit"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black)),
                              )
                            ],
                          ),
                  ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: loadingCheckRes
              ? Center(
                  child: InLoader(),
                )
              : ElevatedButton.icon(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.only(top: 10, bottom: 10)),
                      backgroundColor: MaterialStateProperty.all(btnColor),
                      overlayColor: MaterialStateProperty.all(isReserved
                          ? Color.fromARGB(255, 109, 109, 109)
                          : Colors.blueAccent),
                      elevation: MaterialStateProperty.all(15),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                  onPressed: () {
                    isReserved
                        ? openDialog(context)
                        : reserveTextbook(widget.targetBook.id);
                  },
                  icon: Icon(btnIcon),
                  label: AutoSizeText(
                    btnTitle,
                    style: TextStyle(fontSize: 18),
                  )),
        ),
        Container(
            child: Text(
              "Titres similaires ",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
            ),
            margin: EdgeInsets.only(top: 20, bottom: 10),
            padding: EdgeInsets.only(left: 20, right: 10)),
        FutureBuilder<List<Textbook>>(
          builder: (context, snap) {
            if (snap.hasData) {
              print(snap.data);
              return Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                        padEnds: false,
                        viewportFraction: 1,
                        disableCenter: false,
                        height: 250,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIn = index.toDouble();
                          });
                        }),
                    items: snap.data!.map((rec) {
                      print(rec.title);
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              child: RecommendationCard(
                                textbook: rec,
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new DotsIndicator(
                            dotsCount: snap.data!.length,
                            position: currentIn,
                            decorator: DotsDecorator(
                              color: Color.fromARGB(255, 232, 232, 232),
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ]),
                  ),
                ],
              );
            }
            return Container(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: CircularProgressIndicator(),
              alignment: Alignment.center,
            );
          },
          future: similarbooks,
        )
      ]),
      bottomNavigationBar: BottomNavBar(activeIndex: 1),
    );
  }
}

Future openDialog(context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          title: Text(
            "Votre ouvrage a été reservé avec succès !",
            style: TextStyle(fontWeight: FontWeight.w800, color: russianViolet),
          ),
          content: Container(
              height: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.library_books,
                          color: middleBlueGreen,
                          size: 62.0,
                        ),
                        Text(
                          "Nous attendons votre présence pour la confirmation d’emprunt de ce titre avant la date suivante : 20-06-2022",
                          style: TextStyle(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Si vous dépassez cette date votre réservation sera annulée",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    Column(children: [
                      Row(
                        children: [
                          Icon(Icons.badge),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "La présence de la carte de\n bibliothèque est obligatoire.",
                            softWrap: true,
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )
                    ]),
                  ])),
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(russianViolet)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Fermer',
                ))
          ],
        ));
