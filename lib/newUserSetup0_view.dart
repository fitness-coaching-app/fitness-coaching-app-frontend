import 'package:flutter/material.dart';
import 'color.dart';

//New User Setup
class NewUserSetup0 extends StatelessWidget {
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
              'Welcome to\nFIT+',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            )),
            Expanded(child: Container()),
            Center(
                child: // We’ll ask you some questions to personalize your experience.
                    Text("We’ll ask you some questions to\npersonalize your experience",
                        style: const TextStyle(
                            color: color_lightGrey,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.center)),
            Container(
              //color: Colors.red,
              height: 10,
            ),
            Center(
              child: Container(
                  width: 325,
                  height: 60,
                  // TEXT
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
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: color_teal)),
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
