import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';

class WorkoutPortraitStepPause extends StatefulWidget {
  const WorkoutPortraitStepPause({Key? key}) : super(key: key);
  @override
  _WorkoutPortraitStepPauseState createState() =>
      _WorkoutPortraitStepPauseState();
}

class _WorkoutPortraitStepPauseState extends State<WorkoutPortraitStepPause> {
  Widget _portraitMode() {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(color: color_dark),
                height: MediaQuery.of(context).size.height * 0.14,
                width: MediaQuery.of(context).size.width,
              ),
              LinearProgressIndicator(
                value: 0.6,
                valueColor: AlwaysStoppedAnimation(color_dimmedTeal),
                backgroundColor: color_dark,
                semanticsLabel: 'Linear progress indicator',
              ),
              Positioned(
                  top: (MediaQuery.of(context).size.height * 0.14) / 4,
                  left: 25,
                  child: Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("1",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 36.0),
                            textAlign: TextAlign.center),
                      ))),
              Positioned(
                  top: (MediaQuery.of(context).size.height * 0.14) / 10,
                  left: (MediaQuery.of(context).size.height * 0.105) + 40,
                  child: Container(
                      // color: Colors.red,
                      width: (MediaQuery.of(context).size.width -
                          ((MediaQuery.of(context).size.height * 0.105) + 75)),
                      height: MediaQuery.of(context).size.height * 0.105,
                      child: Center(
                        child: Text("Chess Stretch",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.center),
                      ))),
              Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width / 2 - 13,
                child: Center(
                    child: SvgPicture.asset(
                  'assets/Icon/Detail Expand Icon.svg', // dot dot dot
                  height: 26,
                )),
              )
            ],
          ),
          Stack(children: <Widget>[
            Container(
              decoration: new BoxDecoration(color: color_white),
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height * 0.2197),
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.14,
              decoration: new BoxDecoration(
                  color: Color(0xb20c2b42),
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(15),
                    bottomRight: const Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    25,
                    ((MediaQuery.of(context).size.height * 0.14) / 5),
                    25,
                    ((MediaQuery.of(context).size.height * 0.14) / 5)),
                child: Row(
                  children: [
                    Container(
                        width: 80,
                        height: 65,
                        child: Column(children: [
                          SvgPicture.asset(
                            'assets/Icon/Miscellaneous-Filled_clock.svg', // dot dot dot
                            height: 30,
                          ),
                          Container(
                            height: 5,
                          ),
                          Text("9:45",
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                        ])),
                    Container(
                        width: 80,
                        height: 65,
                        child: Column(children: [
                          Icon(
                            Ionicons.flame,
                            size: 30,
                            color: color_white,
                          ),
                          Container(
                            height: 5,
                          ),
                          Text("500 KCAL",
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                        ])),
                    Expanded(child: Container()),
                    Container(
                      child: SvgPicture.asset(
                        'assets/Icon/Button_pause.svg', // dot dot dot
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ]),
        ],
      ),
    );
  }

  Widget _landscapeMode() {
    return SafeArea(
        child: new Container(
            decoration: new BoxDecoration(color: color_white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Icon/Miscellaneous-Outline_phone.svg', // dot dot dot
                  height: 100,
                ),
                Container(
                  height: 15,
                ),
                Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text("Please rotate your device vertically",
                      style: const TextStyle(
                          color: color_dark,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0),
                      textAlign: TextAlign.center),
                )),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _portraitMode();
          } else {
            return _landscapeMode();
          }
        },
      ),
    );
  }
}
