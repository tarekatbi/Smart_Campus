import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo_app/constants.dart';
import 'package:lottie/lottie.dart';

import '../First_Screen/first_screen.dart';
import '../Login/login_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              titleWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  /*Icon(
                    Icons.edit,
                    color: introIcon,
                  ),*/
                  Text(
                    "Bienvenue",
                    style: TextStyle(
                        color: introTitle,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              body:
                  'Bienvenue sur votre application Smart Campus. Ces quelques écrans vous présentent les fonctionalités phares de votre application.',
              image: Lottie.asset('assets/images/first_screen.json'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.access_time,
                    color: introIcon,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Votre planning",
                    style: TextStyle(
                        color: introTitle,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              body:
                  'Etudiant ou chercheur, retrouvez votre emploi du temps dans votre poche, vos salles de cours, les liens vers la visio...',
              image: Lottie.asset('assets/images/second_screen.json'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.place,
                    color: introIcon,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Repérez-vous",
                    style: TextStyle(
                        color: introTitle,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              body:
                  'Un plan intéractif pour trouver un batiment, les lieux de restauration, ou encore les événements du jour !',
              image: Lottie.asset('assets/images/location.json'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.school,
                    color: introIcon,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Terminé !",
                    style: TextStyle(
                        color: introTitle,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              body:
                  'Si vous etes pret, appuyer sur "Commencer" et laisse l\'experience commence.',
              image: Lottie.asset('assets/images/done.json'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text(
            "Commencer",
            style: TextStyle(
                color: introButton, fontSize: 14, fontWeight: FontWeight.bold),
          ),

          onDone: () => goToHome(context),
          showSkipButton: false,
          //skip: Text('Skip'),
          onSkip: () => goToHome(context),
          next: Icon(
            Icons.arrow_forward,
            color: introButton,
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: introBg,
          dotsFlex: 1,
          nextFlex: 1,
          skipOrBackFlex: 1,
          curve: Curves.slowMiddle,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          freeze: true,
          animationDuration: 400,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => FirstScreen()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: introButton,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        bodyTextStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w700, color: introText),
        bodyPadding: EdgeInsets.only(left: 20, right: 20).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(5),
        pageColor: introBg,
      );
}
