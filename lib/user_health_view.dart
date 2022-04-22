import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/news_feed_view.dart';
import 'package:fitness_coaching_application_test/social_activity_view.dart';
import 'package:fitness_coaching_application_test/user_health_exercise_view.dart';
import 'package:fitness_coaching_application_test/user_health_weight_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class UserHealth extends StatefulWidget {
  const UserHealth({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserHealthState();
}

class UserHealthState extends State<UserHealth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 21,
              ),
              //profile head section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Ionicons.arrow_back,
                        size: 30,
                        color: color_dark,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Health Stats",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left)),
                ],
              ),

              //stats section : exercise
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserHealthExercise()));
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.16,
                          decoration: BoxDecoration(
                              color: Color(0xFFefefef),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Ionicons.flame,
                                            size: 20,
                                            color: Color(0xffee9d25),
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text("Exercise",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xffee9d25),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.left),
                                          Expanded(child: Container()),
                                          Icon(
                                            Ionicons.chevron_forward,
                                            size: 18,
                                            color: color_subtitle,
                                          ),
                                        ]),
                                    Expanded(child: Container()),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            "18",
                                            style: const TextStyle(
                                                color: color_dark,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 36.0),
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text("min",
                                              style: const TextStyle(
                                                  color: color_subtitle,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 18.0))
                                        ])
                                  ]))))),

              //stats section : weight
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserHealthWeight()));
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.16,
                          decoration: BoxDecoration(
                              color: Color(0xFFefefef),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Ionicons.scale,
                                            size: 20,
                                            color: Color(0xff00829e),
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text("Weight",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff00829e),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.left),
                                          Expanded(child: Container()),
                                          Icon(
                                            Ionicons.chevron_forward,
                                            size: 18,
                                            color: color_subtitle,
                                          ),
                                        ]),
                                    Expanded(child: Container()),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            "52.5",
                                            style: const TextStyle(
                                                color: color_dark,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 36.0),
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text("kg",
                                              style: const TextStyle(
                                                  color: color_subtitle,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 18.0))
                                        ])
                                  ]))))),

              //stats section : height
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.16,
                          decoration: BoxDecoration(
                              color: Color(0xFFefefef),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Ionicons.body,
                                            size: 20,
                                            color: Colors.purple,
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text("Height",
                                              style: const TextStyle(
                                                  color: Colors.purple,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.left),
                                          Expanded(child: Container()),
                                          Icon(
                                            Ionicons.chevron_forward,
                                            size: 18,
                                            color: color_subtitle,
                                          ),
                                        ]),
                                    Expanded(child: Container()),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            "170",
                                            style: const TextStyle(
                                                color: color_dark,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 36.0),
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text("cm",
                                              style: const TextStyle(
                                                  color: color_subtitle,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 18.0))
                                        ])
                                  ]))))),

              //stats section : BMI
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.16,
                          decoration: BoxDecoration(
                              color: Color(0xFFefefef),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Ionicons.man,
                                            size: 20,
                                            color: Color(0xff00a682),
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text("BMI",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff00a682),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.left),
                                          Expanded(child: Container()),
                                          Icon(
                                            Ionicons.chevron_forward,
                                            size: 18,
                                            color: color_subtitle,
                                          ),
                                        ]),
                                    Expanded(child: Container()),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            "18.5",
                                            style: const TextStyle(
                                                color: color_dark,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 36.0),
                                          ),
                                        ])
                                  ]))))),

              //bottom section
              Container(
                height: 30,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
