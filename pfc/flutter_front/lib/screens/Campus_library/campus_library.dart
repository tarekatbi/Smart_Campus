import 'package:carousel_slider/carousel_slider.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/Campus_library/a_book.dart';
import 'package:todo_app/screens/Campus_library/components/bubbles.dart';
import 'package:todo_app/screens/Campus_library/components/expanded_card.dart';
import 'package:todo_app/screens/Campus_library/components/middle_title.dart';
import 'package:todo_app/screens/Campus_library/components/recommended_textbook.dart';
import 'package:todo_app/screens/Campus_library/components/textbook_card.dart';
import 'package:todo_app/screens/Campus_map/campus_map.dart';
import 'package:todo_app/services/library.dart';
import '../../components/bottom_nav_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';

class CampusLibrary extends StatefulWidget {
  CampusLibrary({Key? key}) : super(key: key);

  @override
  State<CampusLibrary> createState() => _CampusLibraryState();
}

class _CampusLibraryState extends State<CampusLibrary> {
  late double currentIn = 0;
  final searchQuery = TextEditingController();
  LibraryService libraryService = new LibraryService();
  late Future<List<Textbook>> recommendations;
  late Future<List<ReservedTextbook>> reservedTextbooks;
  late Future<List<Textbook>> popularBooks;

  @override
  void initState() {
    super.initState();
    recommendations = libraryService.loadTextbookRecommandation();
    reservedTextbooks = libraryService.loadReservedTextbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 20, bottom: 25, right: 15, top: 20),
              color: Kblue,
              width: double.infinity,
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //the search bar
                  Text(
                    "Bibliothèque",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 42,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),

                  Text(
                    "Découvrez votre prochaine recommendation et profitez de nos ouvrages.",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromARGB(255, 226, 226, 226)),
                  ),
                  TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: searchQuery,
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                          decoration: mapDecorationStyle),
                      suggestionsCallback: libraryService.loadTextbooks,
                      itemBuilder: (context, Textbook suggestion) {
                        final textbook = suggestion;
                        return ListTile(
                          leading: Icon(
                            Icons.book,
                            color: middleBlueGreen,
                          ),
                          title: Text(
                            textbook.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: russianViolet),
                          ),
                          subtitle: Text(textbook.authors[0]),
                        );
                      },
                      onSuggestionSelected: (Textbook txt) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OneBook(targetBook: txt)));
                      },
                      noItemsFoundBuilder: (context) => Center(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                Icon(Icons.book),
                                SizedBox(),
                                Text("Aucun ouvrage sous le titre " +
                                    searchQuery.text)
                              ])))
                ],
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Bubbles(
                    imageLink:
                        'https://images.unsplash.com/photo-1601073283537-f246319362b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
                    resourceNumber: "5000+",
                    textbookString: "Ouvrages & livres scientifiques",
                  ),
                  Bubbles(
                    imageLink:
                        'https://images.unsplash.com/photo-1532153975070-2e9ab71f1b14?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                    resourceNumber: "1000+",
                    textbookString: "Papiers académiques",
                  )
                ],
              ),
              MiddleTitle(title: "Populaire cette semaine"),
              Row(children: <Widget>[
                TextbookCard(
                    title: "Algorithms to live by",
                    author: "Richard C. Martin",
                    imageLink:
                        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1454296875l/25666050.jpg'),
                TextbookCard(
                    title: "The \$100 Startup",
                    author: " Chris Guillebeau ",
                    imageLink:
                        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1345666854l/12605157.jpg')
              ]),
              SizedBox(
                height: 30,
              ),
              MiddleTitle(title: "Nos recommandations "),
              FutureBuilder<List<Textbook>>(
                future: recommendations,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        CarouselSlider(
                          options: CarouselOptions(
                              padEnds: false,
                              viewportFraction: 1,
                              disableCenter: false,
                              height: 300,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIn = index.toDouble();
                                });
                              }),
                          items: snapshot.data!.map((rec) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: double.infinity,
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
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
                                  dotsCount: snapshot.data!.length,
                                  position: currentIn,
                                  decorator: DotsDecorator(
                                    color: Color.fromARGB(255, 232, 232, 232),
                                    size: const Size.square(9.0),
                                    activeSize: const Size(18.0, 9.0),
                                    activeShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error while loading recommendations");
                  }
                  return BlueLoader();
                },
              ),
              //borrowing section
              MiddleTitle(title: "Vos réservations "),
              FutureBuilder<List<ReservedTextbook>>(
                  future: reservedTextbooks,
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading");
                    }
                    snapshot.data!.map((e) {
                      return Text(e.reservedTextbook.title);
                    });
                    return BlueLoader();
                  })),

              SizedBox(height: 10)
            ],

            //Data about the library
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavBar(
        activeIndex: 1,
      ),
    );
  }
}

class BlueLoader extends StatelessWidget {
  const BlueLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 40),
      child: CircularProgressIndicator(),
      alignment: Alignment.center,
    );
  }
}

class ReservedBook extends StatelessWidget {
  const ReservedBook({Key? key, required this.cover, required this.title})
      : super(key: key);
  final String cover;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [boxShadow], borderRadius: BorderRadius.circular(15)),
      child: new ExpansionCard(
        background: Image.network(
          "https://images-na.ssl-images-amazon.com/images/I/61t1l0hdBJL.jpg",
        ),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
        ),
        children: [ExpandedCard()],
      ),
    );
  }
}
