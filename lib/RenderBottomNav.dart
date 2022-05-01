import 'dart:ui';

import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/news/screen/news_feed_view.dart';
import 'package:fitness_coaching_application_test/social/screen/social_activity_view.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_profile.dart';
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
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: BottomAppBar(
                    color: Color.fromRGBO(239, 239, 239, 0.8),
                    child: Container(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(width: 32),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Home',
                                  icon: Icon(
                                    widget.page == 'home'
                                        ? Ionicons.home
                                        : Ionicons.home_outline,
                                    color: color_dark,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    if (widget.page != 'home') {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                Home(),
                                            transitionDuration: Duration.zero,
                                            reverseTransitionDuration:
                                                Duration.zero,
                                          ),
                                          (route) => false);
                                    }
                                  },
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: widget.page == 'home'
                                      ? color_teal
                                      : Colors.transparent,
                                )
                              ]),
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'News',
                                  icon: Icon(
                                      widget.page == 'news'
                                          ? Ionicons.globe
                                          : Ionicons.globe_outline,
                                      color: color_dark,
                                      size: 30),
                                  onPressed: () {
                                    if (widget.page != 'news') {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                NewsFeed(),
                                            transitionDuration: Duration.zero,
                                            reverseTransitionDuration:
                                                Duration.zero,
                                          ),
                                          (r) => false);
                                    }
                                  },
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: widget.page == 'news'
                                      ? color_teal
                                      : Colors.transparent,
                                )
                              ]),
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Social',
                                  icon: Icon(
                                      widget.page == 'social'
                                          ? Ionicons.people
                                          : Ionicons.people_outline,
                                      color: color_dark,
                                      size: 30),
                                  onPressed: () {
                                    if (widget.page != 'social') {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                Activity(),
                                            transitionDuration: Duration.zero,
                                            reverseTransitionDuration:
                                                Duration.zero,
                                          ),
                                          (r) => false);
                                    }
                                  },
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: widget.page == 'social'
                                      ? color_teal
                                      : Colors.transparent,
                                )
                              ]),
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Profile',
                                  icon: Icon(
                                    widget.page == 'profile'
                                        ? Ionicons.person_circle
                                        : Ionicons.person_circle_outline,
                                    color: color_dark,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    if (widget.page != 'profile') {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                UserProfile(),
                                            transitionDuration: Duration.zero,
                                            reverseTransitionDuration:
                                                Duration.zero,
                                          ),
                                          (r) => false);
                                    }
                                  },
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: widget.page == 'profile'
                                      ? color_teal
                                      : Colors.transparent,
                                )
                              ]),
                          SizedBox(width: 32),
                        ],
                      ),
                    )),
              ))),
    );
  }
}
