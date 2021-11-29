import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'color.dart';

class WorkoutLandscapeStepBegin extends StatefulWidget {
  const WorkoutLandscapeStepBegin({Key? key}) : super(key: key);
  @override
  _WorkoutLandscapeStepBeginState createState() =>
      _WorkoutLandscapeStepBeginState();
}

class _WorkoutLandscapeStepBeginState extends State<WorkoutLandscapeStepBegin> {
  Widget _landscapeMode() {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(color: color_dark),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
            ),
            LinearProgressIndicator(
              value: 0.6,
              valueColor: AlwaysStoppedAnimation(color_dimmedTeal),
              backgroundColor: color_dark,
              semanticsLabel: 'Linear progress indicator',
            ),
            Positioned(
                top: (MediaQuery.of(context).size.height * 0.25) / 5,
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
                top: (MediaQuery.of(context).size.height * 0.25) / 5,
                left: (MediaQuery.of(context).size.height * 0.105) + 30,
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
                (MediaQuery.of(context).size.height * 0.25),
            width: MediaQuery.of(context).size.width,
          ),
          // Positioned(
          //     bottom: 47,
          //     left: 25,
          //     child: Container(
          //       height: MediaQuery.of(context).size.height * 0.24,
          //       width: MediaQuery.of(context).size.width * 0.31,
          //       decoration: BoxDecoration(
          //         color: Colors.red,
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //     ))
        ]),
      ],
    );
  }

  Widget _portraitMode() {
    return SafeArea(
        child: new Container(
            decoration: new BoxDecoration(color: color_white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Icon/Miscellaneous-Outline_phone_hor.svg', // dot dot dot
                  height: 100,
                ),
                Container(
                  height: 15,
                ),
                Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text("Please rotate your device horizontally",
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
