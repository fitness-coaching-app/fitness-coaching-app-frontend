import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/environment.dart';
import 'package:flutter_application_2/homeSection.dart';
import 'package:flutter_application_2/home_view.dart';
import 'package:flutter_application_2/leaderboard.dart';
import 'package:flutter_application_2/search_see_all_course_view.dart';
import 'package:flutter_application_2/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class LeaderboardFollowing extends StatefulWidget {
  const LeaderboardFollowing({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LeaderboardFollowingState();
}

class LeaderboardFollowingState extends State<LeaderboardFollowing> {
  TextEditingController searchController = new TextEditingController();
  List<String> rank = [];
  List<String> username = [];
  List<String> score = [];
  List<String> urls = [];
  int rankCnt = 0;
  final leaderboard = leaderboardFromJson(
      "\{\"results\": \[\{\"rank\": 1,\"username\": \"test1\",\"score\": 25330,\"url\": \"https://i.pinimg.com/474x/7c/4d/15/7c4d1533480bb4c5911d95699fef5186.jpg\"\},\{\"rank\": 2,\"username\": \"test2\",\"score\": 25000,\"url\": \"https://news.artnet.com/app/news-upload/2019/01/Cat-Photog-Feat-256x256.jpg\"\},\{\"rank\": 3,\"username\": \"test3\",\"score\": 12345,\"url\": \"https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg\"\},\{\"rank\": 4,\"username\": \"test4\",\"score\": 5432,\"url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC4q5-ZpLXcl_Cd8j_PONvAQC1l7pVX35u6w&usqp=CAU\"\},\{\"rank\": 5,\"username\": \"test5\",\"score\": 1234,\"url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5YkEJmFjWNPbIANu5itMzRPLZabNlPIkoQ&usqp=CAU\"\}\]\}");
  @override
  Widget build(BuildContext context) {
    for (var i in leaderboard.results) {
      rank.add(i.rank.toString());
      username.add(i.username.toString());
      score.add(i.score.toString());
      urls.add(i.url.toString());
    }
    print(rank);
    print(username);
    print(score);
    print(urls);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Search head section
                          Container(
                            height: 21,
                          ),
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
                              Container(
                                width: 20,
                              ),
                              Text("Leaderboard",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 26.0),
                                  textAlign: TextAlign.left),
                              Expanded(child: Container()),
                              Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(365),
                                      color: Color(0xcce3e3e3)),
                                  child: Icon(
                                    Ionicons.newspaper,
                                    color: color_dark,
                                    size: 23,
                                  )),
                            ],
                          ),

                          //follower toggle
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
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                25,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFC0FFD9),
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: Center(
                                          child: Text("Following",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff00a682),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                        )),
                                    Expanded(child: Container()),
                                    Container(
                                        height: 40,
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                25,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFefefef),
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: Center(
                                            child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UserProfileFollowing()),
                                                  );
                                                },
                                                child: Text("Global",
                                                    style: const TextStyle(
                                                        color: const Color(
                                                            0xffc9c9c9),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: "Poppins",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.0),
                                                    textAlign:
                                                        TextAlign.center))))
                                  ])),

                          //Top 3 Users
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(children: [
                              Positioned(
                                  left: MediaQuery.of(context).size.width / 3 -
                                      20,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width: MediaQuery.of(context).size.width /
                                        3.25,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(child: Container()),
                                        Text(rank[0],
                                            style: const TextStyle(
                                                color: const Color(0xff000000),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            textAlign: TextAlign.center),
                                        Expanded(child: Container()),
                                        SvgPicture.asset(
                                          'assets/Icon/Cartoon Illustration_crown.svg',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.13,
                                            child: Center(
                                                child: GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.26,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.13,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            360),
                                                                image:
                                                                    DecorationImage(
                                                                  image:
                                                                      NetworkImage(
                                                                          urls[
                                                                              0]),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )))))),
                                        Expanded(child: Container()),
                                        Text(
                                            username[0] != null
                                                ? username[0]
                                                : "username",
                                            style: const TextStyle(
                                                color: const Color(0xff000000),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            textAlign: TextAlign.center),
                                        Expanded(child: Container()),
                                        Text(score[0] != null ? score[0] : "0",
                                            style: const TextStyle(
                                                color: color_dimmedTeal,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.0),
                                            textAlign: TextAlign.center)
                                      ],
                                    ),
                                  )),
                              Positioned(
                                  bottom: 0,
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(child: Container()),
                                          Text(rank[1] != null ? rank[1] : "2",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff000000),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.0),
                                              textAlign: TextAlign.center),
                                          Expanded(child: Container()),
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.12,
                                              child: Center(
                                                  child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.24,
                                                          height:
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.12,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              360),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: NetworkImage(
                                                                        urls[
                                                                            1]),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )))))),
                                          Expanded(child: Container()),
                                          Text(
                                              username[1] != null
                                                  ? username[1]
                                                  : "username",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff000000),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.0),
                                              textAlign: TextAlign.center),
                                          Expanded(child: Container()),
                                          Text(
                                              score[1] != null ? score[1] : "0",
                                              style: const TextStyle(
                                                  color: color_dimmedTeal,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 20.0),
                                              textAlign: TextAlign.center)
                                        ],
                                      ))),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(child: Container()),
                                          Text(rank[2] != null ? rank[2] : "3",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff000000),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.0),
                                              textAlign: TextAlign.center),
                                          Expanded(child: Container()),
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.12,
                                              child: Center(
                                                  child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.24,
                                                          height:
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.12,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              360),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: NetworkImage(urls[2] !=
                                                                            null
                                                                        ? urls[
                                                                            2]
                                                                        : ""),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )))))),
                                          Expanded(child: Container()),
                                          Text(
                                              username[2] != null
                                                  ? username[2]
                                                  : "username",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff000000),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.0),
                                              textAlign: TextAlign.center),
                                          Expanded(child: Container()),
                                          Text(
                                              score[2] != null ? score[2] : "0",
                                              style: const TextStyle(
                                                  color: color_dimmedTeal,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 20.0),
                                              textAlign: TextAlign.center)
                                        ],
                                      ))),
                            ]),
                          ),

                          //4th section
                          for (var i = 3; i < rank.length; i++)
                            Container(
                                child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(children: [
                                    Text(rank[i],
                                        style: const TextStyle(
                                            color: const Color(0xff000000),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        textAlign: TextAlign.center),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(40, 0, 15, 0),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(365),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(urls[i])))),
                                    Text(username[i],
                                        style: const TextStyle(
                                            color: const Color(0xff000000),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        textAlign: TextAlign.left)
                                  ])),
                            ]))
                        ])))));
  }
}
