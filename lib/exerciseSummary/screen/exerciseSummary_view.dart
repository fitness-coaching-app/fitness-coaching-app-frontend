import 'package:fitness_coaching_application_test/buildButton.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/forgotPw/widget/rateBar.dart';
import 'package:fitness_coaching_application_test/forgotPw/widget/renderCircularProgress.dart';
import 'package:fitness_coaching_application_test/forgotPw/widget/renderSummaryBar.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseSummary extends StatefulWidget {
  const ExerciseSummary({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExerciseSummaryState();
}

class ExerciseSummaryState extends State<ExerciseSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.4),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Exercise Summary",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 26.0),
                            textAlign: TextAlign.left),
                        Container(
                          height: 30,
                        ),
                        Text("Course Score",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                        Container(
                          height: 30,
                        ),
                        RenderCircularProgress(percentage: "95"),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 35, 0, 20),
                          child: RenderSummaryBar(
                              xp: "45", time: "05:32", calories: "300"),
                        ),
                        RateBar(),
                      ]),
                )),
                Expanded(child: Container()),
                BuildButton(context: context, name: "Done", screenTo: Home()),
                Expanded(child: Container()),
              ],
            )),
      ),
    );
  }
}
