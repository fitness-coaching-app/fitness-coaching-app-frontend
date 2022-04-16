import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/homeSection.dart';
import 'package:fitness_coaching_application_test/home_view.dart';
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

class UserSettingsPassword extends StatefulWidget {
  const UserSettingsPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserSettingsPasswordState();
}

class UserSettingsPasswordState extends State<UserSettingsPassword> {
  TextEditingController currentPwController = new TextEditingController();
  TextEditingController newPwController = new TextEditingController();
  TextEditingController confirmPwController = new TextEditingController();

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
                    child: Text("Change Password",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 26.0),
                        textAlign: TextAlign.left)),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 60,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Current Password",
                  hintStyle: const TextStyle(
                      color: color_subtitle,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
                controller: currentPwController,
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
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 60,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "New Password",
                  hintStyle: const TextStyle(
                      color: color_subtitle,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
                controller: newPwController,
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
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 60,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Confirm New Password",
                  hintStyle: const TextStyle(
                      color: color_subtitle,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
                controller: confirmPwController,
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
            ),

            GestureDetector(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.5),
                      child: new Text("Done",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                          textAlign: TextAlign.center),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: color_teal))),

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
