import 'package:flutter/material.dart';
import 'package:flutter_application_2/newUserSetup5_exPref2_view.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';

class NewUserSetupExPref extends StatefulWidget {
  final String gender;
  final String year;
  final String weight;
  final String height;
  const NewUserSetupExPref(
      {Key? key,
      required this.gender,
      required this.year,
      required this.weight,
      required this.height})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => NewUserSetupExPrefState();
}

class NewUserSetupExPrefState extends State<NewUserSetupExPref> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        new GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Ionicons.arrow_back,
              size: 30,
              color: color_dark,
            )),
        Container(
          height: 45,
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.4),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("We want to know your peferences",
                      style: const TextStyle(
                          color: color_dark,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 28.0),
                      textAlign: TextAlign.left),
                  Container(
                    height: 5,
                  ),
                  Text(
                      "Select the exercise that you prefer\. You can select more than one\.",
                      style: const TextStyle(
                          color: color_subtitle,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
                height: 80,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("Yoga",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: color_lightGrey)),
            Container(
              height: 15,
            ),
            Container(
                height: 80,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("Cardio",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: color_lightGrey)),
            Container(
              height: 40,
            ),
            // Next Button
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewUserSetupExPref2()),
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
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: color_teal))),
              )
            ]),
          ]),
        )),
        Expanded(child: Container()),
      ]),
    )));
  }
}
