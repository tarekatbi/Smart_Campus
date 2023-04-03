import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class PointOfInterest {
  final int id;
  final String name;
  final double long;
  final double lat;
  final List<dynamic> cover;
  final bool floors;
  final List<dynamic> details;
  //the constructor
  const PointOfInterest(
      {required this.name,
      required this.long,
      required this.lat,
      required this.id,
      required this.cover,
      required this.floors,
      required this.details});

  //convert from json to objects
  static PointOfInterest fromJson(Map<String, dynamic> jsonData) {
    return PointOfInterest(
        id: jsonData['id'],
        name: jsonData['titre'],
        long: jsonData['longitude'],
        lat: jsonData['latitude'],
        cover: jsonData['cover'],
        floors: jsonData['floors'],
        details: jsonData['details']);
  }
}

/// Point of interest class with all the methods.
class PointOfInterestApi {
  final String endpoint;
  PointOfInterestApi({required this.endpoint});

  /// Function that retrives all points of interests from the database and parses them. Returns a list of map
  Future<List<PointOfInterest>> loadPointsOfInterests(String query) async {
    final uri = Uri.parse(endpoint);
    final response = await http.get(uri);

    //checking if the response is O.K
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List points = data['data'];
      print(data);
      return points
          .map((json) => PointOfInterest.fromJson(json))
          .where((pointName) {
        final pointNameLower = pointName.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return pointNameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception("Cannot run the request");
    }
  }

  void openPopUpForm(ctx, Position myLocation) {
    Alert(
        context: ctx,
        title: "Nouveau point d'interet",
        content: Column(
          children: <Widget>[
            TextField(
              // controller: title,
              decoration: InputDecoration(
                icon: Icon(Icons.edit_location_alt),
                labelText: 'Titre',
              ),
            ),
            TextField(
              // controller: des,
              decoration: InputDecoration(
                icon: Icon(Icons.info_sharp),
                labelText: 'Description',
              ),
            ),
            TextField(
              showCursor: false,
              readOnly: true,
              decoration: InputDecoration(
                hintText: myLocation.longitude.toString(),
                icon: Icon(Icons.pin_drop),
              ),
            ),
            TextField(
              readOnly: true,
              showCursor: false,
              decoration: InputDecoration(
                icon: Icon(Icons.pin_drop),
                hintText: myLocation.latitude.toString(),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Téléphone",
                icon: Icon(Icons.phone),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                icon: Icon(Icons.email),
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: 'Votre demande d\'ajout a été envoyée avec succès ! ',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Color.fromARGB(255, 24, 0, 90),
                  textColor: Color.fromARGB(255, 255, 255, 255));
              Navigator.pop(ctx);
            },
            child: Text(
              "Ajouter",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
