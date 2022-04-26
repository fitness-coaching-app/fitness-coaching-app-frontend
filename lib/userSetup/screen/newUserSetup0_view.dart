import 'package:fitness_coaching_application_test/buildButton.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'newUserSetup1_gender_view.dart';

//New User Setup
class NewUserSetup0 extends StatefulWidget {
  const NewUserSetup0({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewUserSetup0State();
}

class NewUserSetup0State extends State<NewUserSetup0> {
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
                child: BuildButton(
                    context: context,
                    name: "Next",
                    screenTo: NewUserSetupGender()),
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
