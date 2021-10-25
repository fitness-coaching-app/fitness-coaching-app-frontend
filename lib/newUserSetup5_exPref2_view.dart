import 'package:flutter/material.dart';
import 'package:flutter_application_2/newUserSetup4_comp_view.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';

class NewUserSetupExPref2 extends StatelessWidget {
  const NewUserSetupExPref2({Key? key}) : super(key: key);
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
                  Text("Body Part To Avoid",
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
                  Text("Select the body part that you don’t want to workout.",
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
// Rectangle 22
            Container(
                height: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: const Color(0xffc4c4c4))),
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
                            builder: (context) => NewUserSetupComp()),
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
