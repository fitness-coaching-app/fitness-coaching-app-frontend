import 'package:fitness_coaching_application_test/buildButton.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/exerciseSummary/screen/exerciseSummary_view.dart';
import 'package:flutter/material.dart';

class ExerciseSumLv extends StatefulWidget {
  const ExerciseSumLv({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExerciseSumLvState();
}

class ExerciseSumLvState extends State<ExerciseSumLv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height: MediaQuery.of(context).size.height * 0.05),
            Center(
                child: Text("Level Up !",
                    style: const TextStyle(
                        color: color_white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 32.0),
                    textAlign: TextAlign.center)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 170.0,
                      width: 170.0,
                      color: Colors.transparent,
                      child: Container(
                          decoration: BoxDecoration(
                              color: color_dimmedTeal,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          child: new Center(
                            child: new Text("4",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 64.0),
                                textAlign: TextAlign.center),
                          )),
                    ),
                  ),
                  Container(height: MediaQuery.of(context).size.height * 0.05),
                  Text("Congratulations!\nYou’ve reached level 4",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: BuildButton(
                      context: context,
                      name: "Continue",
                      screenTo: ExerciseSummary())), // Next Button
            ),
            Container(
              //color: Colors.red,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
