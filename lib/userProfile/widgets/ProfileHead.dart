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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 155,
            height: 155,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ))),
        SizedBox(height: 12),
        Text(widget.username,
            style: const TextStyle(
                color: color_dark,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 20.0),
            textAlign: TextAlign.center),
        SizedBox(height: 10),
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
    );
  }
}
