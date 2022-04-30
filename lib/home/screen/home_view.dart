import 'dart:convert';

import 'package:fitness_coaching_application_test/RenderBottomNav.dart';
import 'package:fitness_coaching_application_test/components/build_bottom_nav_bar.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../../api_util.dart';
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
  List<Widget> sections = [];

  Future<List<Widget>> getSections() async {
    var response = await API.get(Environment.getSectionsUrl, withToken: true);

    sections = API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          List<Widget> sections = [];
          for (var i in r.results!) {
            if (i["sectionType"] == "BANNER") {
              List<BannerCard> banners = [];
              for (var a in i["data"]!) {
                banners.add(BannerCard(
                    imageUrl: a["picture"]!, action: a["onClickAction"]!));
              }
              sections.add(BannerSection(
                banners: banners,
              ));
            } else if (i["sectionType"] == "COURSE") {
              List<CourseCard> cards = [];
              for (var a in i["data"]!) {
                cards.add(CourseCard(
                    courseId: a["courseId"],
                    title: a["name"],
                    coverPictureUrl: a["coverPicture"],
                    rating: a["overallRating"] * 1.0));
              }
              sections.add(CourseSection(
                title: i["name"],
                cards: cards,
              ));
            }
          }
          this.sections = sections;
          return sections;
        });
    return sections;
  }

  Widget buildHome(List<Widget> sections) {
    return SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...sections,
                ],
              ),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSections(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return BuildTopBottomBar(
                body: buildHome(sections),
                appBar: NormalAppBar(
                  title: "Hello, ${Hive.box('user').get('data')["displayName"]}!",
                  subtitle: "Welcome!",
                  height: 100,
                  actionButton: SvgPicture.asset(
                    'assets/Icon/Button_search.svg',
                    height: 40,
                  ),
                ),
                page: 'home'
            );
          } else {
            return BuildTopBottomBar(
                body: Loading(),
                page: 'home'
            );
          }
        });
  }
}
