import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/home/homeSection.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/social_activity_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class UserSettingsNotifications extends StatefulWidget {
  const UserSettingsNotifications({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserSettingsNotificationsState();
}

class UserSettingsNotificationsState extends State<UserSettingsNotifications> {
  bool _exerciseReminder = false;
  final _formKey = GlobalKey<FormState>();
  TimeOfDay selectedTime = TimeOfDay.now();
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
                    child: Text("Notifications",
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
            SwitchListTile(
              title: Text("Exercise Reminder",
                  style: TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.left),
              value: _exerciseReminder,
              onChanged: (bool value) {
                setState(() {
                  _exerciseReminder = value;
                });
              },
            ),
            GestureDetector(
                onTap: () {
                  _selectTime(context);
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(children: [
                      Text("Reminder Time",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                      Expanded(child: Container()),
                      // Text
                      Text("${selectedTime.hour}:${selectedTime.minute}",
                          style: const TextStyle(
                              color: color_subtitle,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0),
                          textAlign: TextAlign.right),
                      Icon(Ionicons.chevron_forward,
                          size: 22, color: Color(0xb2517086))
                    ]))),

            //bottom section
            Container(
              height: 30,
            ),
          ],
        ),
      )),
    ));
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.dial,
        confirmText: "CONFIRM",
        cancelText: "NOT NOW",
        helpText: "Reminder Time");
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
