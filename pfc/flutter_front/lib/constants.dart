import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const kPrimaryColor = Color(0xFF306EE7);
const kPrimaryLightColor = Color(0xFFF4F4F4);
const kPrimaryWriteColor = Color(0xFF8D8D8D);
const Kblue = Color.fromARGB(255, 3, 61, 186);
const iconsColor = Color(0xFF7D8597);
const double kDefaultPadding = 10.0;
const buttonColor = Color(0xFF0353A4);
const radio1 = Color(0xFF04e5ae8);
const radio2 = Color(0xFFff4667);
const radio3 = Color(0xFFffb746);
const introButton = Color(0xFF306EE7);
const introBg = Color(0xFFfafafa);
const introIcon = Color(0xFF676767);
const introTitle = Color(0xFF2a2e46);
const introText = Color(0xFF676767);
const points = [
  LatLng(35.662258459552916, -0.6322476267814636),
  LatLng(35.66052379091179, -0.6311962008476257),
  LatLng(35.660545583465165, -0.6310111284255981),
  LatLng(35.6604344413809, -0.6308341026306152),
  LatLng(35.660423545089785, -0.6305846571922302),
  LatLng(35.660314582097044, -0.6292730569839478),
  LatLng(35.660253562756154, -0.628444254398346),
  LatLng(35.66060442332948, -0.6283825635910034),
  LatLng(35.661025018134126, -0.6276261806488037),
  LatLng(35.66113180091841, -0.6272721290588378),
  LatLng(35.66141510149091, -0.6263762712478638),
  LatLng(35.66187709719146, -0.6251451373100281),
  LatLng(35.66282287250514, -0.6257995963096619),
  LatLng(35.662901323410495, -0.6256332993507385),
  LatLng(35.66379478661668, -0.6262636184692383),
  LatLng(35.66287517311728, -0.6281653046607971),
  LatLng(35.6636705740376, -0.6287339329719542),
  LatLng(35.662258459552916, -0.6322476267814636)
];

final mapDecorationStyle = InputDecoration(
    floatingLabelStyle: TextStyle(color: Colors.blue),
    suffixIcon: Icon(Icons.search),
    filled: true,
    fillColor: Color.fromARGB(255, 255, 255, 255),
    labelText: "Rechercher ... ",
    labelStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172)),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusColor: Colors.blue);

final mapTextConfigStyle = TextFieldConfiguration(
    autofocus: false,
    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
    decoration: mapDecorationStyle);

final boxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.4),
  spreadRadius: 2,
  blurRadius: 8,
);
