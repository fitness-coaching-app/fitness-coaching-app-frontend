import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';

class WorkoutPortraitStepFinish extends StatefulWidget {
  const WorkoutPortraitStepFinish({Key? key}) : super(key: key);
  @override
  _WorkoutPortraitStepFinishState createState() =>
      _WorkoutPortraitStepFinishState();
}

class _WorkoutPortraitStepFinishState extends State<WorkoutPortraitStepFinish> {
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
                  child: LinearProgressIndicator(
                    value: 1,
                    valueColor: AlwaysStoppedAnimation(color_dimmedTeal),
                    backgroundColor: color_dark,
                    semanticsLabel: 'Linear progress indicator',
                  )),
              Positioned(
                  top: (MediaQuery.of(context).size.height * 0.14) / 5,
                  left: (MediaQuery.of(context).size.width * 0.4),
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
                  (MediaQuery.of(context).size.height * 0.2197),
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
                bottom: 47,
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
                    'assets/Icon/Miscellaneous-Outline_phone.svg',// dot dot dot
                    height: 100,
                  ),
                Container(height: 15,),
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