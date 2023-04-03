import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/components/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screens/Home/components/input_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/bottom_nav_bar.dart';

class Changer extends StatefulWidget {
  const Changer({Key? key}) : super(key: key);

  @override
  _ChangerState createState() => _ChangerState();
}

class _ChangerState extends State<Changer> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Changer le mot de passe'),
          backgroundColor: Color(0xFF0353A4),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(activeIndex: 3),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              MyInputField(title: "Mot de passe actuel", hint: "Mot de passe"),
              MyInputField(
                  title: "Nouveau mot de passe", hint: "Nouveau mot de passe"),
              MyInputField(
                  title: "Confirmez le Nouveau mot de passe",
                  hint: "Confirmez le Nouveau mot de passe"),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                  text: "Envoyer",
                  press: () => showBottomToast(),
                  color: kPrimaryColor),
            ],
          ),
        ),
      );
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null), // close searchbar
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null); // close searchbar
            } else {
              query = '';
              showSuggestions(context); // back to suggestions
            }
          },
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}

void showBottomToast() => Fluttertoast.showToast(
      msg: "Votre mot de passe a été modifié avec succès",
      fontSize: 18,
      backgroundColor: introIcon,
    );
