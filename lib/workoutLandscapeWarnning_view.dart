import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'color.dart';

class WorkoutLandscapeWarnning extends StatefulWidget {
  const WorkoutLandscapeWarnning({Key? key}) : super(key: key);
  @override
  _WorkoutLandscapeWarnningState createState() =>
      _WorkoutLandscapeWarnningState();
}

class _WorkoutLandscapeWarnningState extends State<WorkoutLandscapeWarnning> {
  Widget _landscapeMode() {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                  decoration: new BoxDecoration(color: color_purple),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width),
              Positioned(
                  top: (MediaQuery.of(context).size.height * 0.25) / 5,
                  left: 25,
                  child: SvgPicture.asset(
                    'assets/Icon/Miscellaneous-Filled_warnned.svg',
                    height: MediaQuery.of(context).size.height * 0.15
                  )),
              Positioned(
                  top: (MediaQuery.of(context).size.height * 0.25) / 5,
                  left: (MediaQuery.of(context).size.height * 0.105) + 40,
                  child: Container(
                      width: (MediaQuery.of(context).size.width -
                          ((MediaQuery.of(context).size.height * 0.105) + 75)),
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
      ),
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
