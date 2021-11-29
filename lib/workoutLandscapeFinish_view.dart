import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter/services.dart';

class WorkoutLandscapeStepFinish extends StatefulWidget {
  const WorkoutLandscapeStepFinish({Key? key}) : super(key: key);
  @override
  _WorkoutLandscapeStepFinishState createState() =>
      _WorkoutLandscapeStepFinishState();
}

class _WorkoutLandscapeStepFinishState
    extends State<WorkoutLandscapeStepFinish> {
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
                    value: 1,
                    valueColor: AlwaysStoppedAnimation(color_dimmedTeal),
                    backgroundColor: color_dark,
                    semanticsLabel: 'Linear progress indicator',
                  )),
              Positioned(
                  top: (MediaQuery.of(context).size.height * 0.25) / 10,
                  left: (MediaQuery.of(context).size.width) / 2.2,
                  child: Icon(
                    Ionicons.checkmark_circle,
                    size: 70,
                    color: color_dark,
                  )),
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
