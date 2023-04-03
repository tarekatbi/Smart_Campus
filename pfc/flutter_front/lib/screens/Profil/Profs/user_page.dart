import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/screens/Profil/Profs/profs2.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../components/bottom_nav_bar.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Informations détaillées'),
          backgroundColor: Color(0xFF0353A4),
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Color.fromARGB(255, 105, 101, 101),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        user.username,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0E0E0E),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/linkedin.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.facebook,
                        color: Color(0xFF0353A4),
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/researchgate.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "E-mail",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF919191),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    RichText(
                      text: TextSpan(
                        text: user.email,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            final toEmail = 'some.email@gmail.com';
                            final subject = 'New Great Post!';
                            final message =
                                'Hello Johannes!\n\nCheck out this post on twitter: https://www.twitter.com/';
                            final url =
                                'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
                          },
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xFF0E0E0E),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFFDDC2),
                        onPrimary: Colors.white,
                        shadowColor: Color(0xFFFFDDDD),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        minimumSize: Size(30, 30),
                      ),
                      child: Icon(Icons.mail),
                      onPressed: () async {
                        final toEmail = user.email;
                        final url = 'mailto:$toEmail?subject=';

                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFFC3C3C3),
                  thickness: 1,
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Département",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF919191),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      user.departement,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF0E0E0E),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color(0xFFC3C3C3),
                  thickness: 1,
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Faculté",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF919191),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      user.faculte,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF0E0E0E),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color(0xFFC3C3C3),
                  thickness: 1,
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Grade",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF919191),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      user.grade,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF0E0E0E),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color(0xFFC3C3C3),
                  thickness: 1,
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Laboratoire",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF919191),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      user.labo,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF0E0E0E),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(activeIndex: 3),
      );
}
