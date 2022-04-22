import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/home/homeSection.dart';
import 'package:fitness_coaching_application_test/news_feed_view.dart';
import 'package:fitness_coaching_application_test/social_activity_view.dart';
import 'package:fitness_coaching_application_test/user_profile_act_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import '../../color.dart';
import '../widget/BannerSection.dart';
import '../widget/BannerCard.dart';
import '../widget/CourseSection.dart';
import '../widget/CourseCard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../loading_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<Widget>> getSections(String accessToken) async {
    var url = Uri.parse(Environment.getSectionsUrl);
    var response = await http
        .get(url, headers: {"Authorization": "Bearer " + accessToken});

    // print(response.body);
    var _dataFromAPI = json.decode(response.body);
    // HomeSection _homeData = HomeSection.fromJson(_dataFromAPI);
    List<Widget> sections = [];
    print(_dataFromAPI);
    for (var i in _dataFromAPI["results"]!) {
      // print(i);
      if (i["sectionType"] == "BANNER") {
        List<BannerCard> banners = [];
        for (var a in i["data"]!) {
          banners
              .add(BannerCard(imageUrl: a["picture"]!, action: a["onClickAction"]!));
        }
        sections.add(BannerSection(
          banners: banners,
        ));
      }
      if(i["sectionType"] == "COURSE"){
        List<CourseCard> cards = [];
        for(var a in i["data"]!){
          cards.add(CourseCard(
              title: a["name"],
              coverPictureUrl: a["coverPicture"],
              rating: a["overallRating"] * 1.0
          ));
        }
        sections.add(CourseSection(
          title: i["name"],
          cards: cards,
        ));
      }
    }
    return sections;
  }

  Widget buildHome(List<Widget> sections) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 21, 25, 0),
                      child: Text("Hello, Robert!",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left),
                    ),
                    Expanded(child: Container()),
                    Padding(
                        padding: EdgeInsets.fromLTRB(25, 21, 25, 0),
                        child: SvgPicture.asset(
                          'assets/Icon/Button_search.svg',
                          height: 40,
                        )),
                  ],
                ),
                Container(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text("Good Morning.",
                      style: const TextStyle(
                          color: color_subtitle,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ),
                SizedBox(height: 10),
                ...sections,
              ],
            ),
          ),
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
                                    Ionicons.home,
                                    color: color_dark,
                                  ),
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
                                  tooltip: 'News',
                                  icon: const Icon(Ionicons.globe_outline,
                                      color: color_dark),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NewsFeed()));
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
                                              UserProfileAct()),
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
                        ],
                      ),
                    )))));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSections("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiYWNjZXNzVG9rZW4iLCJkaXNwbGF5TmFtZSI6InBvcmFtZWUiLCJpYXQiOjE2NTA2MDA1OTIsImV4cCI6MTY1MDYwMTE5Mn0.HANHiB9vl--BYMRyAXMF7COevxTNoBOhO8w-E13bayI"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return buildHome(snapshot.data);
          } else {
            return Loading();
          }
        });
  }
}
