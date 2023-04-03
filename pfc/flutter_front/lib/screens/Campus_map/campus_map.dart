import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/components/box_shadow.dart';
import 'package:todo_app/constants.dart';

import 'package:todo_app/screens/Campus_map/components/point_of_interest.dart';
import 'package:todo_app/screens/Campus_map/components/loader.dart';
import 'package:todo_app/services/map.dart';
import 'package:todo_app/services/networking.dart';
import '../../components/bottom_nav_bar.dart';
import 'components/poi_alert_dialouge.dart';

final Color russianViolet = Color.fromARGB(255, 57, 43, 88);
final Color middleBlueGreen = Color.fromARGB(255, 153, 213, 201);
final TextStyle closeButton =
    TextStyle(fontWeight: FontWeight.w500, color: Color(0xff2354));

class CampusMap extends StatefulWidget {
  CampusMap({Key? key}) : super(key: key);

  @override
  State<CampusMap> createState() => _CampusMapState();
}

class _CampusMapState extends State<CampusMap> with TickerProviderStateMixin {
  Networking networkingInstance =
      new Networking(base_url: "https://smar-t-campus.herokuapp.com/api");
  final MapService mapService = new MapService();
  late int currentIndex = 0;
  late Completer<GoogleMapController> _controller = Completer();
  CameraPosition? _currentLocation;
  final pointsOfinterestsApi = new PointOfInterestApi(
      endpoint: "https://smar-t-campus.herokuapp.com/api/map/get_points");
  late Set<Marker> _markers = Set();
  late double _opacity = 0.0;
  late Set<Polygon> _campusPolygon = Set();
  late List<LatLng> polygonPoints = [];
  late TextEditingController title,
      des,
      email,
      phone = new TextEditingController();
  bool isToggled = true;

  PointOfInterest campusPoint = new PointOfInterest(
      name: 'Campus Coordinates',
      long: -0.6314027309417725,
      lat: 35.660926952186,
      id: 100,
      cover: [""],
      details: [""],
      floors: false);
  final searchQuery = TextEditingController();
  LatLng campusCoordinates = LatLng(35.660926952186, -0.6314027309417725);
  Position? myLocation;

  @override
  void initState() {
    super.initState();
    mapService.createCampusPolygon(_campusPolygon, points);
    _updateCurrentLocation();
    _loadMarkers(_markers);
  }

  /// Update the user's location
  void _updateCurrentLocation() async {
    //loading the icon
    BitmapDescriptor markerBitmap = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5, size: Size(12, 12)),
        'assets/icons/college.png');

    //getting the user's current location
    Position po = await networkingInstance.getCurrentLocation();
    setState(() {
      myLocation = po;
    });

    //adding the icon to the campus entry
    setState(() {
      _markers.add(Marker(
          icon: markerBitmap,
          markerId: MarkerId('Campus Taleb Mourad'),
          position: campusCoordinates,
          infoWindow: InfoWindow(
              title: "campus", snippet: "Université Oran 1 Ahmed Ben bella")));
      _currentLocation = CameraPosition(
        target: campusCoordinates,
        zoom: 16.4746,
      );
    });
    Future.delayed(Duration(milliseconds: 100), () {
      _opacity = 1.0;
      setState(() {});
    });
  }

  Future<void> _changeCurrentMarker(PointOfInterest sug) async {
    GoogleMapController controller = await _controller.future;
    setState(() {
      controller.animateCamera(
          CameraUpdate.newLatLngZoom(LatLng(sug.lat, sug.long), 17.7));
      controller.showMarkerInfoWindow(MarkerId(sug.id.toString()));
    });
  }

  Future<void> locateMe() async {
    //getting the user's current location
    Position location = await networkingInstance.getCurrentLocation();
    GoogleMapController newController = await _controller.future;

    //adding a custom icon for the user's current location
    BitmapDescriptor userBitmap = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5, size: Size(12, 12)),
        'assets/icons/road.png');

    //refreshing the widget with the new location
    setState(() {
      newController.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(location.latitude, location.longitude), 17.7));
      _markers.add(Marker(
          //icon: userBitmap,
          markerId: MarkerId('user'),
          position: LatLng(location.latitude, location.longitude)));
    });
  }

  ///
  Future<void> locateCampus() async {
    GoogleMapController campusController = await _controller.future;
    setState(() {
      campusController.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(campusCoordinates.latitude, campusCoordinates.longitude),
          17.7));
    });
  }

//Display the cutomized icons on the map
//Display the cutomized icons on the map
  Future<void> _loadMarkers(Set<Marker> _markers) async {
    //loading the custom icon
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Networking networkingInstance =
        new Networking(base_url: "https://smar-t-campus.herokuapp.com/api");
    final data = await networkingInstance.getData(
        "/map/get_points", prefs.getString('token'));
    final allMarkers = data['data'];

    for (var i = 0; i < allMarkers.length; i++) {
      String poi_name = allMarkers[i]['titre'];
      double poi_lang = allMarkers[i]['longitude'];
      double poi_lat = allMarkers[i]['latitude'];
      bool poi_floors = allMarkers[i]['floors'];
      List<dynamic> covers = allMarkers[i]['cover'];
      List<dynamic> details = allMarkers[i]['details'];
      var poi_icon = allMarkers[i]['icon'].toString();
      PointOfInterest one_poi = PointOfInterest(
          name: poi_name,
          long: poi_lang,
          lat: poi_lat,
          id: i,
          cover: covers,
          floors: poi_floors,
          details: details);
      Uint8List bytes = (await rootBundle.load('assets/icons/$poi_icon.png'))
          .buffer
          .asUint8List();

      var id = allMarkers[i]['id'];
      setState(() {
        _markers.add(Marker(
            icon: BitmapDescriptor.fromBytes(bytes),
            markerId: MarkerId(id.toString()),
            infoWindow: InfoWindow(
              title: allMarkers[i]['titre'],
            ),
            position: LatLng(one_poi.lat, one_poi.long),
            onTap: () {
              print(one_poi.details);
              openDialog(context, one_poi);
            }));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //if the user's location hasn't been fetched yet, display loader on the screen
    if (myLocation == null) {
      return MapLoader();
    }
    return Scaffold(
        body: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 3),
            child: Stack(children: <Widget>[
              GoogleMap(
                mapToolbarEnabled: true,
                zoomControlsEnabled: true,
                polygons: _campusPolygon,
                myLocationButtonEnabled: true,
                mapType: MapType.terrain,
                markers: _markers,
                compassEnabled: false,
                trafficEnabled: true,
                indoorViewEnabled: true,
                myLocationEnabled: false,
                initialCameraPosition: _currentLocation!,
                onMapCreated: (controller) {
                  _controller.complete(controller);
                },
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(15, 35, 15, 0),
                  child: BoxShadowStyle(
                    ChildWidget: TypeAheadField(
                      hideOnLoading: false,
                      hideOnError: true,
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: searchQuery,
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                          decoration: mapDecorationStyle),
                      suggestionsCallback:
                          pointsOfinterestsApi.loadPointsOfInterests,
                      itemBuilder: (context, PointOfInterest? suggestion) {
                        final point = suggestion;
                        return ListTile(
                          leading: Icon(
                            Icons.where_to_vote,
                            color: middleBlueGreen,
                          ),
                          title: Text(
                            point!.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: russianViolet),
                          ),
                          // subtitle: Text('${point.lat} & ${point.long}'),
                        );
                      },
                      onSuggestionSelected: (PointOfInterest suggestion) {
                        _changeCurrentMarker(suggestion);
                        setState(() {
                          searchQuery.text = suggestion.name;
                        });
                      },
                      noItemsFoundBuilder: (context) =>
                          Center(child: Text("Aucun lieu trouvé")),
                    ),
                  )),
              Positioned(
                  left: 20,
                  bottom: 15,
                  child: FloatingActionButton(
                      backgroundColor: russianViolet,
                      mini: true,
                      onPressed: () {
                        pointsOfinterestsApi.openPopUpForm(
                            context, myLocation!);
                      },
                      child: Icon(Icons.add)))
            ])),
        bottomNavigationBar: BottomNavBar(activeIndex: 2));
  }
}

Future openDialog(context, PointOfInterest poi) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          title: Text(
            poi.name,
            style: TextStyle(fontWeight: FontWeight.w800, color: russianViolet),
          ),
          content: DialougeContent(poi: poi),
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
