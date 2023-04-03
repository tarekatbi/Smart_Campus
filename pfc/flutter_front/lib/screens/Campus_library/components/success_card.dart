import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class SuccessCard extends StatelessWidget {
  const SuccessCard({Key? key, required this.rate}) : super(key: key);

  final double rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RatingStars(
            value: rate,
            starBuilder: (index, color) => Icon(
              Icons.star,
              color: color,
            ),
            starCount: 5,
            starSize: 22,
            valueLabelColor: Color.fromARGB(255, 53, 27, 147),
            valueLabelTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
            valueLabelRadius: 10,
            maxValue: 5,
            starSpacing: 2,
            maxValueVisibility: true,
            valueLabelVisibility: false,
            animationDuration: Duration(milliseconds: 1000),
            valueLabelPadding:
                const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            valueLabelMargin: const EdgeInsets.only(right: 8),
            starOffColor: const Color(0xffe7e8ea),
            starColor: Colors.green,
          ),
          Text(
            "Merci d'avoir noté cet ouvrage",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
