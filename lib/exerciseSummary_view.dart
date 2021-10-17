import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Exercise Summary",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 30,
                      ),
                      Text("Course Score",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 30,
                      ),
                      Center(
                          child: Container(
                              width: 155,
                              height: 155,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: color_purple, width: 7)))),
                      Container(
                        height: 35,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("XP Earned",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.left),
                            Expanded(child: Container()),
                            Text("45",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 32.0),
                                textAlign: TextAlign.right),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Time",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.left),
                            Expanded(child: Container()),
                            Text("05:32",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 32.0),
                                textAlign: TextAlign.right),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Calories",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.left),
                            Expanded(child: Container()),
                            Text("300",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 32.0),
                                textAlign: TextAlign.right),
                          ]),
                      Container(
                        height: 52,
                      ),
                      Text("Rate this Course",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 21.9,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: new SvgPicture.asset(
                                'assets/Icon/Star-Outline.svg',
                                height: 26.3,
                              ),
                            ),
                            Container(
                              width: 16.9,
                            ),
                            Container(
                              child: new SvgPicture.asset(
                                'assets/Icon/Star-Outline.svg',
                                height: 26.3,
                              ),
                            ),
                            Container(
                              width: 16.9,
                            ),
                            Container(
                              child: new SvgPicture.asset(
                                'assets/Icon/Star-Outline.svg',
                                height: 26.3,
                              ),
                            ),
                            Container(
                              width: 16.9,
                            ),
                            Container(
                              child: new SvgPicture.asset(
                                'assets/Icon/Star-Outline.svg',
                                height: 26.3,
                              ),
                            ),
                            Container(
                              width: 16.9,
                            ),
                            Container(
                              child: new SvgPicture.asset(
                                'assets/Icon/Star-Outline.svg',
                                height: 26.3,
                              ),
                            ),
                          ]),
                    ],
                  ),
                )),
                Expanded(child: Container()),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                    child: Container(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.5),
                          child: new Text("Done",
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0),
                              textAlign: TextAlign.center),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: color_teal)),
                  )
                ]),
                Expanded(child: Container()),
              ],
            )),
      ),
    );
  }
}
