import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'loading_view.dart';

class WorkoutPortraitWarnning extends StatelessWidget {
  const WorkoutPortraitWarnning({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      ),
    );
  }
}
