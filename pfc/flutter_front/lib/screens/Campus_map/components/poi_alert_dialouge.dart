import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:todo_app/screens/Campus_map/campus_map.dart';
import 'package:todo_app/screens/Campus_map/components/point_of_interest.dart';

final TextStyle titleStyle =
    TextStyle(fontWeight: FontWeight.w500, color: Colors.grey.shade800);
final Color darkGreen = Color.fromARGB(255, 2, 151, 7);
final darkRoyalBlue = Colors.blue;

class DialougeContent extends StatefulWidget {
  const DialougeContent({
    Key? key,
    required this.poi,
  }) : super(key: key);
  final PointOfInterest poi;

  @override
  State<DialougeContent> createState() => _DialougeContentState();
}

class _DialougeContentState extends State<DialougeContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.poi.details);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
    final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
    final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();

    final List<GlobalKey<ExpansionTileCardState>> keys = [cardA, cardB, cardC];
    final DateTime n = DateTime.now();

    final List<dynamic> floors = widget.poi.details;
    return Container(
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          widget.poi.cover.length != 0
              ? CachedNetworkImage(
                  imageUrl: widget.poi.cover[0],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Text("Aucune image n'est disponible"),
          //create the opening box
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 255, 229),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            margin: EdgeInsets.only(top: 10, bottom: 15),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                    n.hour < 8 && n.hour >= 16
                        ? Icons.close
                        : Icons.access_time,
                    color: n.hour < 8 && n.hour >= 16
                        ? Colors.red.shade700
                        : darkGreen),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    n.hour < 8 && n.hour >= 16
                        ? "Fermé à partir de 16:00"
                        : "Ouvert de 08:00 - 16:00",
                    style: TextStyle(
                        color: n.hour < 8 && n.hour >= 16
                            ? Colors.red.shade800
                            : darkGreen),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            decoration:
                BoxDecoration(border: Border(left: BorderSide(width: 2.0))),
            child: Row(
              children: [
                Icon(Icons.description),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          floors.length > 1
              ? Column(
                  children: List.generate(
                      floors.length,
                      (index) => ExpansionTileCard(
                              key: keys[index],
                              leading:
                                  CircleAvatar(child: Icon(Icons.apartment)),
                              title: Text(
                                "Étage ${index + 1}",
                                style: titleStyle,
                              ),
                              children: <Widget>[
                                Divider(
                                  thickness: 1.0,
                                  height: 1.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    child: Html(
                                      data: floors[index] != ""
                                          ? "<ul>${floors[index]}</ul>"
                                          : "Aucune description n'est disponible",
                                    ),
                                  ),
                                )
                              ])))
              : Container(
                  child: Html(data: floors[0]),
                ),
          SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(5.0),
                      primary: middleBlueGreen,
                      fixedSize: const Size(20, 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70))),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(2.0),
                      primary: middleBlueGreen,
                      fixedSize: const Size(20, 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70))),
                )
              ])
        ]),
      ),
    );
  }
}
