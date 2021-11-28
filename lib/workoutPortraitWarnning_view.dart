import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'color.dart';

class WorkoutPortraitWarnning extends StatefulWidget {
  const WorkoutPortraitWarnning({Key? key}) : super(key: key);
  @override
  _WorkoutPortraitWarnningState createState() =>
      _WorkoutPortraitWarnningState();
}

class _WorkoutPortraitWarnningState extends State<WorkoutPortraitWarnning> {
  Widget _portraitMode() {
    return SafeArea(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                    decoration: new BoxDecoration(color: color_purple),
                    height: MediaQuery.of(context).size.height * 0.14,
                    width: MediaQuery.of(context).size.width),
                Positioned(
                    top: (MediaQuery.of(context).size.height * 0.14) / 10,
                    left: 25,
                    child: SvgPicture.asset(
                      'assets/Icon/Miscellaneous-Filled_warnned.svg',
                      height: MediaQuery.of(context).size.height * 0.105,
                    )),
                Positioned(
                    top: (MediaQuery.of(context).size.height * 0.14) / 10,
                    left: (MediaQuery.of(context).size.height * 0.105) + 40,
                    child: Container(
                        // color: Colors.red,
                        width: (MediaQuery.of(context).size.width -
                            ((MediaQuery.of(context).size.height * 0.105) +
                                75)),
                        height: MediaQuery.of(context).size.height * 0.105,
                        child: Center(
                          child: Text("Pose Correction Info Info Here",
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
                    'assets/Icon/Detail Expand Icon.svg',
                    height: 26,
                  )),
                )
              ],
            ),
            Stack(children: <Widget>[
              Container(
                decoration: new BoxDecoration(color: color_dark),
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