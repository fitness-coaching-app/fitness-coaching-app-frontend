import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/news/screen/news_feed_view.dart';
import 'package:fitness_coaching_application_test/social/screen/social_activity_view.dart';
import 'package:fitness_coaching_application_test/user_profile_act_view.dart';
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
  Color homeColor = color_white;
  Color newsColor = color_white;
  Color socialColor = color_white;
  Color profileColor = color_white;
  @override
  Widget build(BuildContext context) {
    if (widget.page == 'home') {
      homeColor = color_teal;
    } else if (widget.page == 'news') {
      newsColor = color_teal;
    } else if (widget.page == 'social') {
      socialColor = color_teal;
    } else
      profileColor = color_teal;
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
                              color: homeColor,
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewsFeed()));
                              },
                            ),
                            Container(
                              height: 3,
                              width: 20,
                              color: newsColor,
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Activity()));
                              },
                            ),
                            Container(
                              height: 3,
                              width: 20,
                              color: socialColor,
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
                              color: profileColor,
                            )
                          ]),
                      Expanded(child: Container()),
                    ],
                  ),
                ))));
  }
}
