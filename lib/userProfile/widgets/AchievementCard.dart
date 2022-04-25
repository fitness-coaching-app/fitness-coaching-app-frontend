import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_profile_follower_view.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_profile_following_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AchievementCard extends StatefulWidget {
  final String header;
  final String description;
  final String imageUrl;

  AchievementCard({
    Key? key,
    required this.header,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AchievementCardState();
}

class AchievementCardState extends State<AchievementCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: color_lightGrey, borderRadius: BorderRadius.circular(15)),
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
                    color: Color(0xff35aacf),
                    image:
                        DecorationImage(image: NetworkImage(widget.imageUrl))),
              ),
              Expanded(child: Container()),
              Text(widget.header,
                  style: const TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.center),
              Expanded(child: Container()),
              Text(widget.description,
                  style: const TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  textAlign: TextAlign.center),
            ],
          )),
    );
  }
}
