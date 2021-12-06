import 'package:flutter/material.dart';
import 'package:flutter_application_2/exerciseSumLv_view.dart';
import 'package:flutter_application_2/exerciseSummary_view.dart';
import 'color.dart';
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                      child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExerciseSumLv()),
                      );
                    },
                    child: Container(
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.5),
                          child: new Text("Continue",
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0),
                              textAlign: TextAlign.center),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: color_teal)),
                  ))
                ]),
              ), // Next Button
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
