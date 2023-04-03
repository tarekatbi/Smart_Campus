import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/components/search_bar.dart';
import 'package:todo_app/screens/Profil/Profs/user_page.dart';
import 'package:todo_app/screens/Profil/components/body.dart';
import '../../../components/bottom_nav_bar.dart';

class User {
  final String username;
  final String email;
  final String departement;
  final String faculte;
  final String grade;
  final String labo;

  const User({
    required this.username,
    required this.email,
    required this.departement,
    required this.faculte,
    required this.grade,
    required this.labo,
  });
}

class Profs2 extends StatefulWidget {
  const Profs2({Key? key}) : super(key: key);

  @override
  _Profs2State createState() => _Profs2State();
}

class _Profs2State extends State<Profs2> {
  List<User> users = [
    const User(
      username: 'Aribi Noureddine',
      email: 'aribi.noureddine@gmail.com',
      departement: 'Informatique',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'MAA',
      labo: 'LITIO',
    ),
    const User(
      username: 'Ait Sidhoum Djilali',
      email: 'djilait@yahoo.com',
      departement: 'Chimie',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'Professeur',
      labo: 'LSOA',
    ),
    const User(
      username: 'Amrane Bakhta',
      email: 'fatema_amrane@yahoo.fr',
      departement: 'Informatique',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'Professeur',
      labo: '/',
    ),
    const User(
      username: 'Bouamrane Karim',
      email: 'kbouamrane20@gmail.com',
      departement: 'Informatique',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'Professeur',
      labo: '/',
    ),
    const User(
      username: 'Benali Larabi',
      email: 'larabi.benali@yahoo.com',
      departement: 'Informatique',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'Docteur',
      labo: '/',
    ),
    const User(
      username: 'Bengueddach Asmaa',
      email: 'asmaa.bengueddach@gmail.com',
      departement: 'Informatique',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'MCB',
      labo: 'LIO',
    ),
    const User(
      username: 'Mami Mohammed Amine',
      email: 'aminehome@yahoo.fr',
      departement: 'Informatique',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'MCB',
      labo: 'RIIR',
    ),
    const User(
      username: 'Merad Boudia Omar Rafik',
      email: 'rafik.merad@gmail.com',
      departement: 'Informatique',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'Docteur',
      labo: 'STIC',
    ),
    const User(
      username: 'Haffaf Hafid',
      email: 'haffaf_hafid@yahoo.fr',
      departement: 'Informatique',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'Professeur',
      labo: 'RIIR',
    ),
    const User(
      username: 'Sayah Mohamed',
      email: 'sayahmh@gmail.com',
      departement: 'Informatique',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'MAA',
      labo: 'LITIO',
    ),
    const User(
      username: 'Mechach Kheira',
      email: 'mechach.kheira@gmail.com',
      departement: 'Informatique',
      faculte: 'Sciences Exactes et Appliqués',
      grade: 'Docteur',
      labo: 'LAPECI',
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Professeurs'),
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
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Slidable(
              startActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: ((context) {
                      // call
                    }),
                    icon: Icons.phone,
                    backgroundColor: Colors.green,
                  ),
                  SlidableAction(
                    onPressed: ((context) {
                      // mail
                    }),
                    icon: Icons.mail,
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.account_circle, size: 36),
                  title: Text(user.username),
                  //subtitle: Text(user.email),
                  contentPadding: const EdgeInsets.all(8),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserPage(user: user),
                    ));
                  },
                ),
              ),
            );
          },
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
