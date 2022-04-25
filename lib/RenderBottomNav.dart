import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/news/screen/news_feed_view.dart';
import 'package:fitness_coaching_application_test/social/screen/social_activity_view.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_profile_act_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RenderBottomNav extends StatefulWidget {
  final String page;
  RenderBottomNav({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RenderBottomNavState();
}

class RenderBottomNavState extends State<RenderBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                                if (widget.page != 'home') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                }
                              },
                            ),
                            Container(
                              height: 3,
                              width: 20,
                              color: widget.page == 'home'
                                  ? color_teal
                                  : color_white,
                            )
                          ]),
                      Expanded(child: Container()),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              tooltip: 'News',
                              icon:
                                  const Icon(Ionicons.globe, color: color_dark),
                              onPressed: () {
                                if (widget.page != 'news') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewsFeed()));
                                }
                              },
                            ),
                            Container(
                              height: 3,
                              width: 20,
                              color: widget.page == 'news'
                                  ? color_teal
                                  : color_white,
                            )
                          ]),
                      Expanded(child: Container()),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              tooltip: 'Social',
                              icon: const Icon(Ionicons.people_outline,
                                  color: color_dark),
                              onPressed: () {
                                if (widget.page != 'social') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Activity()));
                                }
                              },
                            ),
                            Container(
                              height: 3,
                              width: 20,
                              color: widget.page == 'social'
                                  ? color_teal
                                  : color_white,
                            )
                          ]),
                      Expanded(child: Container()),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              tooltip: 'Profile',
                              icon: const Icon(Ionicons.person_circle_outline,
                                  color: color_dark),
                              onPressed: () {
                                if (widget.page != 'profile') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserProfileAct()));
                                }
                              },
                            ),
                            Container(
                              height: 3,
                              width: 20,
                              color: widget.page == 'profile'
                                  ? color_teal
                                  : color_white,
                            )
                          ]),
                      Expanded(child: Container()),
                    ],
                  ),
                ))));
  }
}