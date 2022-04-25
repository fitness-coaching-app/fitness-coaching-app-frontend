import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

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
                  _publishFollowers = value;
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
                  _allowReactions = value;
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
