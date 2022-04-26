import 'package:fitness_coaching_application_test/buildButton.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/exerciseSummary/screen/exerciseSumLv_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseSumFinished extends StatelessWidget {
  const ExerciseSumFinished({Key? key}) : super(key: key);
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
                child: Text("COURSE\nCOMPLETED !",
                    style: const TextStyle(
                        color: color_white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 32.0),
                    textAlign: TextAlign.center)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // This makes the blue container full width.
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(100.0),
                      decoration: BoxDecoration(
                          color: color_white, shape: BoxShape.circle),
                      height: 220,
                      child: Center(
                        child: Container(
                          height: 110,
                          child: new SvgPicture.asset(
                            'assets/Icon/Cartoon Illustration_cheers.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: BuildButton(
                      context: context,
                      name: "Continue",
                      screenTo: ExerciseSumLv())), // Next Button
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
