import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'color.dart';
import 'package:flutter/services.dart';

class WorkoutLandscapeStepCounting extends StatefulWidget {
  const WorkoutLandscapeStepCounting({Key? key}) : super(key: key);
  @override
  _WorkoutLandscapeStepCountingState createState() =>
      _WorkoutLandscapeStepCountingState();
}

class _WorkoutLandscapeStepCountingState
    extends State<WorkoutLandscapeStepCounting> {
  Widget _landscapeMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
                decoration: new BoxDecoration(color: color_dark),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: LinearProgressIndicator(
                  value: 0.3,
                  valueColor: AlwaysStoppedAnimation(color_dimmedTeal),
                  backgroundColor: color_dark,
                  semanticsLabel: 'Linear progress indicator',
                )),
            Positioned(
              top: (MediaQuery.of(context).size.height * 0.25) / 10,
              right: 60,
              child: Text("98",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 36.0),
                  textAlign: TextAlign.center),
            ),
            Positioned(
              bottom: (MediaQuery.of(context).size.height * 0.25) / 10,
              right: 50,
              child: Text("99",
                  style: const TextStyle(
                      color: color_subtitle,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.center),
            ),
            Positioned(
                top: (MediaQuery.of(context).size.height * 0.25) / 4,
                left: 25,
                child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Center(
                      child: Text("Chest Stretch",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.center),
                    ))),
            Positioned(
              bottom: 0,
              left: MediaQuery.of(context).size.width * 0.5,
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
          Positioned(
              bottom: 15,
              left: 25,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width * 0.31,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
              ))
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
