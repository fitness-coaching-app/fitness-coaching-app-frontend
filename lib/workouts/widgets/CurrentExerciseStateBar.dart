import 'package:fca_pose_validation/fca_pose_processor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentExerciseStateBar extends StatefulWidget {
  ExerciseState currentState;
  CurrentExerciseStateBar({
    Key? key,
    required this.currentState,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CurrentExerciseStateBarState();
}

class _CurrentExerciseStateBarState extends State<CurrentExerciseStateBar> {

  Widget _introStateBar() {
    return Container(
      decoration: new BoxDecoration(color: color_dark),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LinearProgressIndicator(
            minHeight: 3,
            value: 0.6,
            valueColor: AlwaysStoppedAnimation(color_dimmedTeal),
            backgroundColor: color_dark,
            semanticsLabel: 'Linear progress indicator',
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 80,
            child: Row(children: [
              SizedBox(
                width: 25,
              ),
              Container(
                  width: 62,
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
                          textAlign: TextAlign.center))),
              SizedBox(
                width: 25,
              ),
              Flexible(
                child: Center(
                  child: Text(widget.currentState.stepName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0),
                      textAlign: TextAlign.center),
                ),
              ),
              SizedBox(
                width: 25,
              )
            ]),
          ),
          Center(
              child: SvgPicture.asset(
                'assets/Icon/Detail Expand Icon.svg', // dot dot dot
              )),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _exercisingStateDetail(Color textColor, Color backgroundColor) {
    return Container(
      decoration: new BoxDecoration(color: backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 25 + 3 // Padding + Indicator
          ),
          Container(
            height: 80, // Normal Height + Padding + Indicator
            child: Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Text(widget.currentState.stepName,
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0)),
                  ),
                  _countingWidget(widget.currentState.repeatCount,widget.currentState.target, textColor),
                  SizedBox(
                    width: 25,
                  )
                ]),
          ),
          Center(
              child: SvgPicture.asset(
                'assets/Icon/Detail Expand Icon.svg', // dot dot dot
              )),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _countingWidget(int currentCount, int target, Color textColor) {
    return Text("$currentCount",
        style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
            fontSize: 36.0),
        textAlign: TextAlign.center);
  }

  Widget _exercisingStateBar() {
    return Stack(
      children: [
        _exercisingStateDetail(Colors.white, color_dark),
        ClipRect(
            child: Align(
                alignment: Alignment.topLeft,
                widthFactor: (widget.currentState.repeatCount / widget.currentState.target),
                child: _exercisingStateDetail(color_dark, color_dimmedTeal)
            )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // return _introStateBar();
    return _exercisingStateBar();
  }
}
