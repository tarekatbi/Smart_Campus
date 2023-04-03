import 'dart:convert';
import 'package:todo_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

//TODO: REFACTOR THIS CODE
class Networking {
  late String? base_url;
  Networking({this.base_url});

  /// Method that sends POST request to logs/registers the user
  postRequest(User user_data, String endPoint) async {
    var url = Uri.parse("${base_url}${endPoint}");
    var body = json.encode(
        {'matricule': user_data.matricule, 'password': user_data.password});
    var response = await http.post(url,
        headers: {"content-Type": "application/json"}, body: body);
    return response;
  }

  /// Method that returns the user's current location using package Geolocator
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission locationPermission;
    bool turn_on_location = false;

    //test if the user has enabled location access to the App
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      turn_on_location = await Geolocator.openLocationSettings();
      if (!turn_on_location)
        return Future.error("Location service is not enabled");
    }
    locationPermission = await Geolocator.checkPermission();

    //check if the user has denied the permission of the app
    if (locationPermission == LocationPermission.denied) {
      //request their permission again
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        //user explicitly denied the permission for the App
        return Future.error("User has denied access ");
      }
    }

    //User has granted access ==> return their current position
    return await Geolocator.getCurrentPosition();
  }

  /// Method that returns the json points parsed
  Future<dynamic> getData(String endpoint, String? token) async {
    var url = Uri.parse("${this.base_url}${endpoint}");
    var response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token': token!
    });

    //TODO: add an error exception in this segment.
    return jsonDecode(response.body);
  }
}
