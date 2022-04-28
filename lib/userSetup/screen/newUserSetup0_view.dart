import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
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
              Text(
                  "We’ll ask you some questions to personalize your experience",
                  style: const TextStyle(
                      color: color_lightGrey,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.center),
              Container(
                //color: Colors.red,
                height: 10,
              ),
              MainButtonHighlight(text: "Next", onPressed: (){
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewUserSetupGender()),
                            );
              }),
              Container(
                //color: Colors.red,
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
