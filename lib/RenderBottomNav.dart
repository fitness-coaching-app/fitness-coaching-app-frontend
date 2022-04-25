import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/social_activity_view.dart';
import 'package:fitness_coaching_application_test/user_profile_act_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RenderBottomNav extends StatefulWidget {
  RenderBottomNav({
    Key? key,
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
                              icon:
                                  const Icon(Ionicons.globe, color: color_dark),
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
                              color: color_white,
                            )
                          ]),
                      Expanded(child: Container()),
                    ],
                  ),
                ))));
  }
}
