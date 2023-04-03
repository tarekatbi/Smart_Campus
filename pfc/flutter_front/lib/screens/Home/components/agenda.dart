import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/Home/components/ajout_tache.dart';
import 'package:todo_app/screens/Home/components/button.dart';
import 'package:todo_app/screens/Home/components/caroussel.dart';
import 'package:todo_app/screens/Home/components/header_with_seachbox.dart';
import 'package:todo_app/screens/Home/components/title_with_more_bbtn.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/Home/home_screen.dart';
import '../../../components/bottom_nav_bar.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class Agenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          DateFormat.MMMM().format(DateTime.now()),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1f2f49),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF1f2f49),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AjoutTachepage()),
                    ),
                  },
              icon: Icon(
                Icons.add,
                color: Color(0xFF1f2f49),
              )),
        ],
        backgroundColor: Color(0xFFd5f2ff),
        titleSpacing: 100,
      ),
      bottomNavigationBar: BottomNavBar(activeIndex: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                color: Color(0xFFd5f2ff),
                child: DatePicker(
                  DateTime.now(),
                  height: 90,
                  width: 70,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Color(0xFFff7a4f),
                  selectedTextColor: Colors.white,
                  deactivatedColor: Color(0xFF1f2f49),
                  dateTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1f2f49),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
