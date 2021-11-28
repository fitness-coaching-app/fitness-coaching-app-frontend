import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'loading_view.dart';

class WorkoutPortraitStepCounting extends StatelessWidget {
  const WorkoutPortraitStepCounting({Key? key}) : super(key: key);
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
                      value: 0.6,
                      valueColor: AlwaysStoppedAnimation(color_dimmedTeal),
                      backgroundColor: color_dark,
                      semanticsLabel: 'Linear progress indicator',
                    )),
                Positioned(
                    top: (MediaQuery.of(context).size.height * 0.14) / 4,
                    right: 25,
                    child: Text("00:00",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 36.0),
                        textAlign: TextAlign.center)),
                Positioned(
                    top: (MediaQuery.of(context).size.height * 0.14) / 10,
                    right: (MediaQuery.of(context).size.height * 0.105) * 2,
                    child: Container(
                        width: (MediaQuery.of(context).size.width -
                            ((MediaQuery.of(context).size.height * 0.105) +
                                75)),
                        height: MediaQuery.of(context).size.height * 0.105,
                        child: Center(
                          child: Text("Chest Stretch",
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
                    'assets/Icon/Detail Expand Icon.svg',// dot dot dot
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
