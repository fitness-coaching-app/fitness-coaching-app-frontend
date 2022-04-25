import 'package:fitness_coaching_application_test/RenderBottomNav.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/AchievementCard.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/ProfileHead.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/StatsCard.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/TwoToggleIcons.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'user_profile_act_view.dart';

class UserProfileAchieve extends StatefulWidget {
  const UserProfileAchieve({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserProfileAchieveState();
}

class UserProfileAchieveState extends State<UserProfileAchieve> {
  String numberOfFollower = "20";
  String numberOfFollowing = "40";
  String height = "170";
  String weight = "52.5";
  String bmi = "18.5";
  bool isPrivate = true;
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
                    Text("Profile",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 26.0),
                        textAlign: TextAlign.left),
                    Expanded(child: Container()),
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(365),
                            color: color_dark),
                        child: Icon(
                          Ionicons.ellipsis_horizontal,
                          color: color_white,
                          size: 18,
                        )),
                  ],
                ),

                //profile picture details
                ProfileHead(
                    username: "mariosnyder",
                    imageUrl:
                        "https://images.theconversation.com/files/443350/original/file-20220131-15-1ndq1m6.jpg?ixlib=rb-1.1.0&rect=0%2C0%2C3354%2C2464&q=45&auto=format&w=926&fit=clip",
                    numberOfFollower: numberOfFollower,
                    numberOfFollowing: numberOfFollowing),

                //stats section
                StatsCard(
                    height: height,
                    weight: weight,
                    bmi: bmi,
                    isPrivate: isPrivate),

                //news and achievement toggle
                TwoToggleIcons(
                  options1: Ionicons.newspaper,
                  options2: Ionicons.ribbon,
                  screenTo: UserProfileAct(),
                  isSelectOptn1: false,
                ),

                //achievement section
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AchievementCard(
                        header: "Move Goal Achieved",
                        description: "Imperdiet odio integer.",
                        imageUrl:
                            "https://images.emojiterra.com/google/noto-emoji/v2.034/512px/1f3c6.png"),
                    Expanded(child: Container()),
                    AchievementCard(
                        header: "Move Goal Achieved",
                        description: "Imperdiet odio integer.",
                        imageUrl:
                            "https://images.emojiterra.com/google/noto-emoji/v2.034/512px/1f3c6.png"),
                  ],
                ),

                //bottom section
                Container(
                  height: 30,
                ),
              ],
            ),
          )),
        ),
        bottomNavigationBar: RenderBottomNav(
          page: 'profile',
        ));
  }
}
