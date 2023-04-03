import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo_app/constants.dart';

import '../../../components/bottom_nav_bar.dart';

import '../../../components/bottom_nav_bar.dart';

class MapLoader extends StatelessWidget {
  const MapLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //a component with blue background and a spining circle
    return Container(
        color: Kblue,
        child: Stack(
          children: [
            SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar(activeIndex: 3),
            )
          ],
        ));
  }
}
