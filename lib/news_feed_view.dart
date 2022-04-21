import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/homeSection.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/newsFeed.dart';
import 'package:fitness_coaching_application_test/news_article_view.dart';
import 'package:fitness_coaching_application_test/social_activity_view.dart';
import 'package:fitness_coaching_application_test/user_profile_act_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  List<String> newsHeader = [];
  List<String> newsDetails = [];
  List<String> likes = [];
  List<String> picture = [];
  List<String> onClickAction = [];
  final news = newsFeedFromJson(
      "\{\"results\": \[\{\"newsHeader\": \"6 ท่าบริหาร เสริมสร้างปอดแข็งแรง\",\"newsDetails\": \"test1\",\"likes\": 2530,\"picture\": \"https://i.pinimg.com/474x/7c/4d/15/7c4d1533480bb4c5911d95699fef5186.jpg\",\"onClickAction\": \"open --news=15aruv210c\"\},\{\"newsHeader\": \"ออกกำลังกายยังไงให้น้ำหนักลด\",\"newsDetails\": \"test2\",\"likes\": 200,\"picture\": \"https://news.artnet.com/app/news-upload/2019/01/Cat-Photog-Feat-256x256.jpg\",\"onClickAction\": \"open --news=15aruv210c\"\},\{\"newsHeader\": \"อาหารเพื่อสุขภาพสำหรับนักกีฬา\",\"newsDetails\": \"test3\",\"likes\": 1234,\"picture\": \"https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg\",\"onClickAction\": \"open --news=15aruv210c\"\},\{\"newsHeader\": \"แกว่งแขนอย่างไรให้ได้สุขภาพ\",\"newsDetails\": \"test4\",\"likes\": 52,\"picture\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC4q5-ZpLXcl_Cd8j_PONvAQC1l7pVX35u6w&usqp=CAU\",\"onClickAction\": \"open --news=15aruv210c\"\},\{\"newsHeader\": \"อยากมีสุขภาพดีต้องทำอย่างไร\",\"newsDetails\": \"test5\",\"likes\": 14,\"picture\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5YkEJmFjWNPbIANu5itMzRPLZabNlPIkoQ&usqp=CAU\"\,\"onClickAction\": \"open --news=15aruv210c\"}\]\}");
  @override
  Widget build(BuildContext context) {
    for (var i in news.results) {
      newsHeader.add(i.newsHeader.toString());
      newsDetails.add(i.newsDetails.toString());
      likes.add(i.likes.toString());
      picture.add(i.picture.toString());
      onClickAction.add(i.onClickAction.toString());
    }
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
                    Text("News",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 26.0),
                        textAlign: TextAlign.left),
                    Expanded(child: Container()),
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(365)),
                        child: Icon(
                          Ionicons.filter_circle,
                          color: color_dark,
                          size: 30,
                        )),
                  ],
                ),

                Container(
                  height: 10,
                ),

                //news section
                for (var i = 0; i < news.results.length; i++)
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsArticle(
                                      newsHeader: newsHeader[i],
                                      newsDetails: newsDetails[i],
                                      likes: likes[i],
                                      picture: picture[i])),
                            );
                          },
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(picture[i]),
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.5),
                                          BlendMode.darken),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(newsHeader[i],
                                            style: const TextStyle(
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.0),
                                            textAlign: TextAlign.left),
                                        Container(
                                          height: 10,
                                        ),
                                        Container(
                                            height: 30,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Color(0xDDefefef),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Ionicons.heart,
                                                      color: color_dark,
                                                      size: 20,
                                                    ),
                                                    Expanded(
                                                        child: Container()),
                                                    Text(likes[i],
                                                        style: const TextStyle(
                                                            color: color_dark,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "Poppins",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.0),
                                                        textAlign:
                                                            TextAlign.left),
                                                    Expanded(
                                                        child: Container()),
                                                  ],
                                                ))),
                                        Expanded(child: Container()),
                                        Text(newsDetails[i],
                                            style: const TextStyle(
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left)
                                      ]))))),

                //bottom section
                Container(
                  height: 30,
                ),
              ],
            ),
          )),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: BottomAppBar(
                    color: Color(0xffffffff),
                    child: Container(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Home',
                                  icon: const Icon(
                                    Ionicons.home_outline,
                                    color: color_dark,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                    );
                                  },
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: color_white,
                                )
                              ]),
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'News',
                                  icon: const Icon(Ionicons.globe,
                                      color: color_dark),
                                  onPressed: () {},
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: color_teal,
                                )
                              ]),
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Community',
                                  icon: const Icon(Ionicons.people_outline,
                                      color: color_dark),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Activity()));
                                  },
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: color_white,
                                )
                              ]),
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Profile',
                                  icon: const Icon(
                                      Ionicons.person_circle_outline,
                                      color: color_dark),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserProfileAct()));
                                  },
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: color_white,
                                )
                              ]),
                          Expanded(child: Container()),
                        ],
                      ),
                    )))));
  }
}
