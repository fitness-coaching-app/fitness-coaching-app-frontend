import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_profile_follower_view.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_profile_following_view.dart';
import 'package:flutter/material.dart';

class ProfileHead extends StatefulWidget {
  final String username;
  final String imageUrl;
  final String numberOfFollower;
  final String numberOfFollowing;

  ProfileHead({
    Key? key,
    required this.username,
    required this.imageUrl,
    required this.numberOfFollower,
    required this.numberOfFollowing,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileHeadState();
}

class ProfileHeadState extends State<ProfileHead> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
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
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.height * 0.20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              image: DecorationImage(
                                image: NetworkImage(widget.imageUrl),
                                fit: BoxFit.cover,
                              ))))),
            ),
            Expanded(child: Container()),
            Text(widget.username,
                style: const TextStyle(
                    color: color_dark,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0),
                textAlign: TextAlign.center),
            Expanded(child: Container()),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfileFollower()),
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
                        text: widget.numberOfFollower + " "),
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
                          builder: (context) => UserProfileFollowing()),
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
                        text: widget.numberOfFollowing + " "),
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
        ));
  }
}
