import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'newUserSetup1_gender_view.dart';

//New User Setup
class NewUserSetup0 extends StatelessWidget {
  const NewUserSetup0({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: Container()),
            Center(
                child: Text("Welcome to\nFIT+",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 48.0),
                    textAlign: TextAlign.center)),
            Expanded(child: Container()),
            Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: // We’ll ask you some questions to personalize your experience.
                        Text(
                            "We’ll ask you some questions to personalize your experience",
                            style: const TextStyle(
                                color: color_lightGrey,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.center))),
            Container(
              //color: Colors.red,
              height: 10,
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
                                builder: (context) => NewUserSetupGender()),
                          );
                        },
                        child: Container(
                            height: 60,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.5),
                              child: new Text("Next",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.0),
                                  textAlign: TextAlign.center),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: color_teal))),
                  )
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
