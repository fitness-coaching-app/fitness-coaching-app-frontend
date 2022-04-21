import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/homeSection.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/news_feed_view.dart';
import 'package:fitness_coaching_application_test/social_activity_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class UserProfileSettings extends StatefulWidget {
  const UserProfileSettings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserProfileSettingsState();
}

class UserProfileSettingsState extends State<UserProfileSettings> {
  @override
  Widget build(BuildContext context) {
    String url =
        "https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg";
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
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Ionicons.arrow_back,
                    size: 30,
                    color: color_dark,
                  )),

              //profile picture details
              Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(360),
                                    image: DecorationImage(
                                      image: NetworkImage(url),
                                      fit: BoxFit.cover,
                                    )))),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("MarioSnyder",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.left),
                            Container(
                              height: 5,
                            ),
                            Text("Level 4     2550 XP",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left)
                          ]),
                    ],
                  )),

              //options section
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Text("Edit Profile",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        Expanded(child: Container()),
                        Icon(Ionicons.chevron_forward,
                            size: 22, color: Color(0xb2517086))
                      ]))),
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Text("Privacy",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        Expanded(child: Container()),
                        Icon(Ionicons.chevron_forward,
                            size: 22, color: Color(0xb2517086))
                      ]))),
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Text("Notifications",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        Expanded(child: Container()),
                        Icon(Ionicons.chevron_forward,
                            size: 22, color: Color(0xb2517086))
                      ]))),
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Text("My QR Code",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        Expanded(child: Container()),
                        Icon(Ionicons.chevron_forward,
                            size: 22, color: Color(0xb2517086))
                      ]))),
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Text("Change Password",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        Expanded(child: Container()),
                        Icon(Ionicons.chevron_forward,
                            size: 22, color: Color(0xb2517086))
                      ]))),
              Container(height: 38),
              GestureDetector(
                  onTap: () {},
                  child: Center(
                      child: Text("Sign Out",
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.center))),

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
