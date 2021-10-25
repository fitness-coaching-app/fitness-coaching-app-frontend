import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'newUserSetup3_exPref_view.dart';

class NewUserSetupWeight extends StatelessWidget {
  const NewUserSetupWeight({Key? key}) : super(key: key);
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
            child: new SvgPicture.asset(
              'assets/Icon/Cartoon Illustration_weight.svg',
              height: 100,
            ),
          ),
        ),
        Container(
          height: 40,
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
                  Text("Weight and Height",
                      style: const TextStyle(
                          color: color_dark,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 26.0),
                      textAlign: TextAlign.left),
                  Container(
                    height: 5,
                  ),
                  Text("Please enter your weight and height",
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
                height: 60,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 18, 6, 18),
                          child: Container(
                            height: 31,
                            child: Text("Enter your weight",
                                style: const TextStyle(
                                  color: color_subtitle,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.left),
                          )),
                      Expanded(child: Container()),
                      // kg
                      Text("kg",
                          style: const TextStyle(
                              color: color_dimmedTeal,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.right)
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
                height: 60,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                          child: Container(
                            height: 31,
                            child: Text("Enter your height",
                                style: const TextStyle(
                                  color: color_subtitle,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.left),
                          )),
                      // cm
                      Expanded(child: Container()),
                      Text("cm",
                          style: const TextStyle(
                              color: color_dimmedTeal,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.right)
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
                            builder: (context) => NewUserSetupExPref()),
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
