import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewUserSetupBd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          Ionicons.arrow_back,
          size: 30,
          color: color_dark,
        ),
        Container(
          height: 45,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.4),
            child: new SvgPicture.asset(
              'assets/icons/Cartoon Illustration_bd.svg',
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
                  Text("When Is Your Birthday",
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
                  Text("Please enter your year of birth",
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
                width: 325,
                height: 80,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 230,
                        height: 30.5,
                        child: Text("Enter your birthday year",
                            style: const TextStyle(
                                color: color_subtitle,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                      ),
                      Icon(
                        Ionicons.calendar,
                        size: 28,
                        color: color_dark,
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
            Container(
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
          ]),
        )),
        Expanded(child: Container()),
      ]),
    )));
  }
}
