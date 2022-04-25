import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/home/homeSection.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/social_activity_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class UserPeople extends StatefulWidget {
  const UserPeople({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserPeopleState();
}

class UserPeopleState extends State<UserPeople> {
  String username = "sixtyfoldviolator";
  String followButton = "Follow";
  Color followButtonBg = color_teal;
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
                      child: Text("$username",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left)),
                ],
              ),

              //profile picture details
              Container(
                height: 20,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Center(
                            child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        image: DecorationImage(
                                          image: NetworkImage(url),
                                          fit: BoxFit.cover,
                                        ))))),
                      ),
                      Expanded(child: Container()),
                      Text("$username",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.center),
                      Expanded(child: Container()),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserProfileFollower()),
                                  );
                                },
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      style: const TextStyle(
                                          color: color_subtitle,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      text: "20 "),
                                  TextSpan(
                                      style: const TextStyle(
                                          color: color_subtitle,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Poppins",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      text: " Follower"),
                                ]))),
                            Container(
                              width: 42,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserProfileFollowing()),
                                  );
                                },
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      style: const TextStyle(
                                          color: color_subtitle,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      text: "40 "),
                                  TextSpan(
                                      style: const TextStyle(
                                          color: color_subtitle,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Poppins",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      text: " Following")
                                ])))
                          ]),
                    ],
                  )),

              //follow button
              Container(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    if (followButton == "Follow") {
                      setState(() {
                        followButton = "Unfollow";
                        followButtonBg = color_lightGrey;
                      });
                    } else {
                      setState(() {
                        followButton = "Follow";
                        followButtonBg = color_teal;
                      });
                    }
                  },
                  child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: followButtonBg,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(followButton,
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center)))),

              //news and achievement toggle
              Container(
                height: 20,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xFFefefef),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: (MediaQuery.of(context).size.width / 2) - 25,
                        decoration: BoxDecoration(
                            color: Color(0xFFC0FFD9),
                            borderRadius: BorderRadius.circular(40)),
                        child: Icon(
                          Ionicons.newspaper,
                          color: Color(0xFF00A682),
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfileAchieve()),
                            );
                          },
                          child: Icon(
                            Ionicons.ribbon,
                            color: Color(0xffc9c9c9),
                          )),
                      Expanded(child: Container()),
                    ]),
              ),

              //post section
              Container(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        image: DecorationImage(
                                          image: NetworkImage(url),
                                          fit: BoxFit.cover,
                                        )))),
                            Container(
                              width: 15,
                            ),
                            Text("$username",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left),
                          ]),
                      Container(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFC0FFD9)),
                      ),
                      Container(
                        height: 10,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                child: Icon(
                              Ionicons.happy_outline,
                              size: 20,
                              color: color_subtitle,
                            )),
                            Container(
                              width: 5,
                            ),
                            Text("123",
                                style: const TextStyle(
                                    color: color_subtitle,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.left),
                            Container(
                              width: 22,
                            ),
                            Container(
                                child: Icon(
                              Ionicons.chatbubble_outline,
                              size: 20,
                              color: color_subtitle,
                            )),
                            Container(
                              width: 5,
                            ),
                            Text("123",
                                style: const TextStyle(
                                    color: color_subtitle,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.left),
                          ]),
                      Container(
                        height: 5,
                      ),
                      Text("13 hours ago",
                          style: const TextStyle(
                              color: color_subtitle,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 11.0),
                          textAlign: TextAlign.left)
                    ]),
              ),

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
