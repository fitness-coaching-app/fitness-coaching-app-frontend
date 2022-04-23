import 'dart:convert';

import 'package:fitness_coaching_application_test/fb_reaction_box.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/home/homeSection.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/news_article_view.dart';
import 'package:fitness_coaching_application_test/news_feed_view.dart';
import 'package:fitness_coaching_application_test/social_activity.dart';
import 'package:fitness_coaching_application_test/social_leaderboard_following_view.dart';
import 'package:fitness_coaching_application_test/user_profile_act_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class ActivityDetail extends StatefulWidget {
  final String username;
  final String urls;
  final String picture;
  final List<List<String>>? likesUsername;
  final List<List<String>>? comments;
  final DateTime time;

  const ActivityDetail(
      {Key? key,
      required this.username,
      required this.urls,
      required this.picture,
      this.likesUsername,
      this.comments,
      required this.time})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ActivityDetailState();
}

class ActivityDetailState extends State<ActivityDetail> {
  // String username = "username";
  // String urls = "https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg";
  // String picture =
  //     "https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg";
  // List<List<String>>? likesUsername = [
  //   ["username1", "username2"],
  //   ["like", "haha"]
  // ];
  // List<List<String>>? comments = [
  //   ["username1", "username2", "username3"],
  //   ["comments1", "comments2", "comments3"]
  // ];
  // DateTime time = DateTime.parse("2022-04-06 20:18:04Z");

  TextEditingController commentController = new TextEditingController();
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
              //activity head section
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
                  Text("Activity",
                      style: const TextStyle(
                          color: color_dark,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 26.0),
                      textAlign: TextAlign.left),
                ],
              ),

              Container(
                height: 10,
              ),

              //activity detail
              Container(
                  child: Column(children: [
                Row(children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(365),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.urls)))),
                  Text(widget.username,
                      style: const TextStyle(
                          color: color_dark,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left)
                ]),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          margin: EdgeInsets.only(bottom: 0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.picture),
                                  // colorFilter: ColorFilter.mode(
                                  //     Colors.black.withOpacity(0.5),
                                  //     BlendMode.darken),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10)),
                        ))),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 15),
                        child: Text(
                            widget.time.hour.toString() +
                                ":" +
                                widget.time.minute.toString() +
                                "   •   " +
                                widget.time.day.toString() +
                                "/" +
                                widget.time.month.toString() +
                                "/" +
                                widget.time.year.toString(),
                            style: const TextStyle(
                                color: color_subtitle,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.left))),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(7, 0, 0, 5),
                        child: Row(children: [
                          Icon(
                            Ionicons.happy,
                            color: Colors.orangeAccent,
                            size: 20,
                          ),
                          if (widget.likesUsername != null)
                            for (var i = 0;
                                i < widget.likesUsername!.length;
                                i++)
                              Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                      widget.likesUsername![0][i].toString() +
                                          ",",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: color_subtitle,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Poppins",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0),
                                      textAlign: TextAlign.left)),
                          Text(
                              widget.likesUsername != null ? " and others" : "",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: color_subtitle,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left)
                        ]))),
                FbReaction(),
                Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 0, 20),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.happy_outline,
                          color: color_subtitle,
                          size: 25,
                        ),
                        Container(
                          width: 10,
                        ),
                        Text("React",
                            style: const TextStyle(
                                color: color_subtitle,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left),
                        Container(
                          width: 35,
                        ),
                        Icon(
                          Ionicons.chatbox_outline,
                          color: color_subtitle,
                          size: 25,
                        ),
                        Container(
                          width: 10,
                        ),
                        Text("Comment",
                            style: const TextStyle(
                                color: color_subtitle,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left)
                      ],
                    )),

                //comment tab
                Container(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Write a comment...",
                        hintStyle: const TextStyle(
                            color: color_subtitle,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                        suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Ionicons.send,
                              size: 25,
                              color: color_dark,
                            ))),
                    controller: commentController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (String? value) => validateEmail(value),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: color_lightGrey,
                  ),
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.only(bottom: 20),
                ),

                //comments section
                if (widget.comments != null)
                  for (var i = 0; i < widget.comments![0].length; i++)
                    Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Row(children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(365),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(widget.comments![0]
                                                    [i] !=
                                                null
                                            ? "https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg"
                                            : "https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg")))),
                            Text(
                                widget.comments![0][i] != null
                                    ? widget.comments![0][i].toString()
                                    : "",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left)
                          ]),
                          Container(
                              margin: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.height * 0.06,
                                  0,
                                  0,
                                  10),
                              child: Text(
                                  widget.comments![1][i] != null
                                      ? widget.comments![1][i].toString()
                                      : "",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left))
                        ])),
              ])),

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
