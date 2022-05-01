import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';

import '../../color.dart';

class QuickDetail extends StatelessWidget {
  final String difficulty;
  final String overallRating;

  QuickDetail({required this.difficulty, required this.overallRating});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      //LTag Rating
      Container(
          height: 50,
          width: 75,
          decoration: new BoxDecoration(
            color: const Color(0xfff0c016),
            borderRadius: new BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Icon/Miscellaneous-Filled_star.svg',
                  height: 17.5,
                ),
                Expanded(child: Container()),
                Container(
                  child: Text(overallRating,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          )),
      Container(
        width: 15,
      ),
      //LTag Difficulty
      Container(
          height: 50,
          width: 75,
          decoration: new BoxDecoration(
            color: const Color(0xffee9715),
            borderRadius: new BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.flash,
                  size: 17.5,
                  color: color_white,
                ),
                Expanded(child: Container()),
                Container(
                  child: Text(difficulty,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          )),
    ]);
  }
}
