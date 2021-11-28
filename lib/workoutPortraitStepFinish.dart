import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';

class WorkoutPortraitStepFinish extends StatelessWidget {
  const WorkoutPortraitStepFinish({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      ),
    );
  }
}
