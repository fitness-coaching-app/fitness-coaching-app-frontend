import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/main.dart';
import 'package:fitness_coaching_application_test/news_feed_view.dart';
import 'package:fitness_coaching_application_test/social_activity_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';
// import 'package:intl/date_symbol_data_local.dart';

class UserHealthExerciseDetail extends StatefulWidget {
  const UserHealthExerciseDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserHealthExerciseDetailState();
}

class UserHealthExerciseDetailState extends State<UserHealthExerciseDetail> {
  DateTime test = DateTime.parse("2020-04-04");
  String formatDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

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
                      child: Text(formatDate,
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left)),
                ],
              ),

              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: Row(children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: Center(
                          child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                  height:
                                      MediaQuery.of(context).size.width * 0.42,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://media.npr.org/assets/img/2021/08/11/gettyimages-1279899488_wide-f3860ceb0ef19643c335cb34df3fa1de166e2761-s1100-c50.jpg"),
                                        fit: BoxFit.cover,
                                      ))))),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width * .42,
                        height: MediaQuery.of(context).size.height * 0.14,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Container()),
                              Text("4:00 PM - 4:15 PM",
                                  style: const TextStyle(
                                      color: color_subtitle,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                              Expanded(child: Container()),
                              Text("Weight Loss Training",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                  textAlign: TextAlign.left),
                              Expanded(child: Container()),
                            ]))
                  ])),

              //detail
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Duration",
                                      style: const TextStyle(
                                          color: color_subtitle,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Poppins",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      textAlign: TextAlign.left),
                                  Text("0:03:21",
                                      style: const TextStyle(
                                          color: color_dark,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Poppins",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 24.0),
                                      textAlign: TextAlign.left)
                                ])),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Calories",
                                      style: const TextStyle(
                                          color: color_subtitle,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Poppins",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      textAlign: TextAlign.left),
                                  Text("300 KCAL",
                                      style: const TextStyle(
                                          color: color_dark,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Poppins",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 24.0),
                                      textAlign: TextAlign.left)
                                ]))
                      ])),

              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Course Score",
                                    style: const TextStyle(
                                        color: color_subtitle,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign: TextAlign.left),
                                Text("95 %",
                                    style: const TextStyle(
                                        color: color_dark,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 24.0),
                                    textAlign: TextAlign.left)
                              ])),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("XP Earned",
                                    style: const TextStyle(
                                        color: color_subtitle,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign: TextAlign.left),
                                Text("45",
                                    style: const TextStyle(
                                        color: color_dark,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 24.0),
                                    textAlign: TextAlign.left)
                              ])),
                    ],
                  )),

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
