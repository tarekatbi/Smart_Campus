import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:todo_app/services/networking.dart';

/// Map utils class : functions and methods that are crucial for the functioing of the map service
class MapService {
  ///Method that loads the list of markers and displays them on the map

  /// Method that creates the campus polygon
  void createCampusPolygon(
      Set<Polygon> _campusPolygon, List<LatLng> points) async {
    _campusPolygon.add(Polygon(
        polygonId: PolygonId("0"),
        points: points,
        strokeWidth: 1,
        fillColor: Color.fromARGB(49, 14, 122, 210)));
  }
}
