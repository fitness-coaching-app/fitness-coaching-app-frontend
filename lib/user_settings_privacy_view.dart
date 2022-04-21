import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/homeSection.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/news_feed_view.dart';
import 'package:fitness_coaching_application_test/social_activity_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class UserSettingsPrivacy extends StatefulWidget {
  const UserSettingsPrivacy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserSettingsPrivacyState();
}

class UserSettingsPrivacyState extends State<UserSettingsPrivacy> {
  bool _publishScore = false;
  bool _publishFollowers = false;
  bool _allowReactions = false;
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
                    child: Text("Privacy",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 26.0),
                        textAlign: TextAlign.left)),
              ],
            ),

            // DIVIDER
            Container(
              height: 20,
            ),
            Text("Leaderboard",
                style: const TextStyle(
                    color: color_subtitle,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                textAlign: TextAlign.left),
            SwitchListTile(
              title: Text("Publish My Score",
                  style: TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.left),
              value: _publishScore,
              onChanged: (bool value) {
                setState(() {
                  _publishScore = value;
                });
              },
            ),
            Container(
              height: 20,
            ),
            Text("Activities & Achievements",
                style: const TextStyle(
                    color: color_subtitle,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                textAlign: TextAlign.left),
            SwitchListTile(
              title: Text("Publish to My Followers",
                  style: TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.left),
              value: _publishFollowers,
              onChanged: (bool value) {
                setState(() {
                  _publishScore = value;
                });
              },
            ),
            SwitchListTile(
              title: Text("Allow Reactions",
                  style: TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.left),
              value: _allowReactions,
              onChanged: (bool value) {
                setState(() {
                  _publishScore = value;
                });
              },
            ),

            //bottom section
            Container(
              height: 30,
            ),
          ],
        ),
      )),
    ));
  }
}
