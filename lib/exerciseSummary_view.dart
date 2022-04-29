import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseSummary extends StatelessWidget {
  final int score;
  final int xpEarned;
  final int duration;
  final String activityId;


  const ExerciseSummary({Key? key,
    required this.score,
    required this.xpEarned,
    required this.duration,
    required this.activityId
  }) : super(key: key);
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
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 155.0,
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    width: 155,
                                    height: 155,
                                    child: new CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          color_purple),
                                      backgroundColor: color_lightGrey,
                                      value: (score / 100),
                                      strokeWidth: 7,
                                    ),
                                  ),
                                ),
                                Center(
                                    child: Text("$score %",
                                        style: const TextStyle(
                                            color: color_purple,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 40.0),
                                        textAlign: TextAlign.center)),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                            Text("$xpEarned",
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
                            Text("${Duration(seconds: duration).inMinutes.toString().padLeft(2, "0")}:${Duration(seconds: duration).inSeconds.remainder(60).toString().padLeft(2, "0")}",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 32.0),
                                textAlign: TextAlign.right),
                          ]),
                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Text("Calories",
                      //           style: const TextStyle(
                      //               color: color_dark,
                      //               fontWeight: FontWeight.w600,
                      //               fontFamily: "Poppins",
                      //               fontStyle: FontStyle.normal,
                      //               fontSize: 20.0),
                      //           textAlign: TextAlign.left),
                      //       Expanded(child: Container()),
                      //       Text("300",
                      //           style: const TextStyle(
                      //               color: color_dark,
                      //               fontWeight: FontWeight.w600,
                      //               fontFamily: "Poppins",
                      //               fontStyle: FontStyle.normal,
                      //               fontSize: 32.0),
                      //           textAlign: TextAlign.right),
                      //     ]),
                      Container(
                        height: 20,
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
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: new SvgPicture.asset(
                                'assets/Icon/Star-Outline.svg',
                                height: 28.1,
                              ),
                            ),
                            Container(
                              width: 16.9,
                            ),
                            Container(
                              child: new SvgPicture.asset(
                                'assets/Icon/Star-Outline.svg',
                                height: 28.1,
                              ),
                            ),
                            Container(
                              width: 16.9,
                            ),
                            Container(
                              child: new SvgPicture.asset(
                                'assets/Icon/Star-Outline.svg',
                                height: 28.1,
                              ),
                            ),
                            Container(
                              width: 16.9,
                            ),
                            Container(
                              child: new SvgPicture.asset(
                                'assets/Icon/Star-Outline.svg',
                                height: 28.1,
                              ),
                            ),
                            Container(
                              width: 16.9,
                            ),
                            Container(
                              child: new SvgPicture.asset(
                                'assets/Icon/Star-Outline.svg',
                                height: 28.1,
                              ),
                            ),
                          ]),
                    ],
                  ),
                )),
                Expanded(child: Container()),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                      child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
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
                  ))
                ]),
                Expanded(child: Container()),
              ],
            )),
      ),
    );
  }
}
