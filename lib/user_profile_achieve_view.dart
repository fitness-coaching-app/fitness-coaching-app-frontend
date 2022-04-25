import 'package:fitness_coaching_application_test/RenderBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';

import 'user_profile_act_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class UserProfileAchieve extends StatefulWidget {
  const UserProfileAchieve({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserProfileAchieveState();
}

class UserProfileAchieveState extends State<UserProfileAchieve> {
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
                Container(
                  height: 20,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: Center(
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Icon/camera.png'),
                                            fit: BoxFit.cover,
                                          ))))),
                        ),
                        Expanded(child: Container()),
                        Text("mariosnyder",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.center),
                        Expanded(child: Container()),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserProfileFollower()),
                                    );
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        style: const TextStyle(
                                            color: color_subtitle,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        text: "20 "),
                                    TextSpan(
                                        style: const TextStyle(
                                            color: color_subtitle,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        text: " Follower"),
                                  ]))),
                              Container(
                                width: 42,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserProfileFollowing()),
                                    );
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        style: const TextStyle(
                                            color: color_subtitle,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        text: "40 "),
                                    TextSpan(
                                        style: const TextStyle(
                                            color: color_subtitle,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        text: " Following")
                                  ])))
                            ]),
                      ],
                    )),

                //stats section
                Container(
                  height: 10,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(
                        color: Color(0xFFefefef),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Stats",
                                        style: const TextStyle(
                                            color: color_dark,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        textAlign: TextAlign.left),
                                    Expanded(child: Container()),
                                    Icon(
                                      Ionicons.lock_closed,
                                      size: 13,
                                      color: color_subtitle,
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Text("Private",
                                        style: const TextStyle(
                                            color: color_subtitle,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left),
                                    Container(
                                      width: 10,
                                    ),
                                    Icon(
                                      Ionicons.chevron_forward,
                                      size: 18,
                                      color: color_subtitle,
                                    ),
                                  ]),
                              Container(
                                height: 14,
                              ),

                              //height weight bmi
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(child: Container()),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Height",
                                              style: const TextStyle(
                                                  color: color_purple,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.0),
                                              textAlign: TextAlign.left),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                style: const TextStyle(
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Poppins",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 24.0),
                                                text: "170"),
                                            TextSpan(
                                                style: const TextStyle(
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Poppins",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 24.0),
                                                text: " "),
                                            TextSpan(
                                                style: const TextStyle(
                                                    color: color_subtitle,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Poppins",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.0),
                                                text: "cm")
                                          ]))
                                        ]),
                                    Expanded(child: Container()),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Weight",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff00829e),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.0),
                                              textAlign: TextAlign.left),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                style: const TextStyle(
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Poppins",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 24.0),
                                                text: "52.5"),
                                            TextSpan(
                                                style: const TextStyle(
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Poppins",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 24.0),
                                                text: " "),
                                            TextSpan(
                                                style: const TextStyle(
                                                    color: color_subtitle,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Poppins",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.0),
                                                text: "kg")
                                          ]))
                                        ]),
                                    Expanded(child: Container()),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("BMI",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff00a682),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Poppins",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.0),
                                              textAlign: TextAlign.left),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                style: const TextStyle(
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Poppins",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 24.0),
                                                text: "18.5"),
                                          ]))
                                        ]),
                                    Expanded(child: Container()),
                                  ])
                            ]))),

                //news and achievement toggle
                Container(
                  height: 20,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFFefefef),
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfileAct()),
                            );
                          },
                          child: Icon(
                            Ionicons.newspaper,
                            color: Color(0xffc9c9c9),
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                            height: 40,
                            width: (MediaQuery.of(context).size.width / 2) - 25,
                            decoration: BoxDecoration(
                                color: Color(0xFFC0FFD9),
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(
                              Ionicons.ribbon,
                              color: Color(0xff00a682),
                            )),
                      ]),
                ),

                //achievement section
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: color_lightGrey,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(365),
                                    color: Color(0xff35aacf)),
                              ),
                              Expanded(child: Container()),
                              Text("Move Goal Achieved",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.center),
                              Expanded(child: Container()),
                              Text("Imperdiet odio integer.",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.center),
                            ],
                          )),
                    ),
                    Expanded(child: Container()),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: color_lightGrey,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(365),
                                    color: Color(0xff35aacf)),
                              ),
                              Expanded(child: Container()),
                              Text("Move Goal Achieved",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.center),
                              Expanded(child: Container()),
                              Text("Imperdiet odio integer.",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.center),
                            ],
                          )),
                    ),
                  ],
                ),

                //achievement section
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: color_lightGrey,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(365),
                                    color: Color(0xff35aacf)),
                              ),
                              Expanded(child: Container()),
                              Text("Move Goal Achieved",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.center),
                              Expanded(child: Container()),
                              Text("Imperdiet odio integer.",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.center),
                            ],
                          )),
                    ),
                    Expanded(child: Container()),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: color_lightGrey,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(365),
                                    color: Color(0xff35aacf)),
                              ),
                              Expanded(child: Container()),
                              Text("Move Goal Achieved",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.center),
                              Expanded(child: Container()),
                              Text("Imperdiet odio integer.",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.center),
                            ],
                          )),
                    ),
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
