import 'package:fitness_coaching_application_test/buildButton.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/loading_view.dart';

//New User Setup
class NewUserSetupComp extends StatelessWidget {
  const NewUserSetupComp({Key? key}) : super(key: key);
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
                child: Text(
              'You’re\nall set',
              style: Theme.of(context).textTheme.headline1,
            )),
            Expanded(child: Container()),
            Center(
                child: Container(
                    height: 56,
                    child: Text("You can now use the app",
                        style: const TextStyle(
                            color: color_lightGrey,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign
                            .center)) // We’ll ask you some questions to personalize your experience.
                ),
            Container(
              //color: Colors.red,
              height: 10,
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: BuildButton(
                      context: context,
                      name: "Let's Go",
                      screenTo: Home())), // Next Button
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
