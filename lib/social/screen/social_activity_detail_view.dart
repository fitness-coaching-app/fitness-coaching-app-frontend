import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/fb_reaction_box.dart';
import 'package:fitness_coaching_application_test/social/widget/ActivityPicture.dart';
import 'package:fitness_coaching_application_test/social/widget/LikeBar.dart';
import 'package:fitness_coaching_application_test/social/widget/ReactionsBarV2.dart';
import 'package:fitness_coaching_application_test/social/widget/RenderComments.dart';
import 'package:fitness_coaching_application_test/social/widget/TimeBar.dart';
import 'package:fitness_coaching_application_test/social/widget/UsernameBar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ActivityDetail extends StatefulWidget {
  final String username;
  final String urls;
  final String picture;
  final List<List<String>>? likesUsername;
  final List<List<String>>? comments;
  final DateTime time;

  const ActivityDetail(
      {Key? key,
      required this.username,
      required this.urls,
      required this.picture,
      this.likesUsername,
      this.comments,
      required this.time})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ActivityDetailState();
}

class ActivityDetailState extends State<ActivityDetail> {
  // String username = "username";
  // String urls = "https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg";
  // String picture =
  //     "https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg";
  // List<List<String>>? likesUsername = [
  //   ["username1", "username2"],
  //   ["like", "haha"]
  // ];
  // List<List<String>>? comments = [
  //   ["username1", "username2", "username3"],
  //   ["comments1", "comments2", "comments3"]
  // ];
  // DateTime time = DateTime.parse("2022-04-06 20:18:04Z");
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
              //activity head section
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
                  Container(
                    width: 20,
                  ),
                  Text("Activity",
                      style: const TextStyle(
                          color: color_dark,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 26.0),
                      textAlign: TextAlign.left),
                ],
              ),

              Container(
                height: 10,
              ),

              //activity detail
              Container(
                  child: Column(children: [
                UsernameBar(imageUrl: widget.urls, username: widget.username),
                ActivityPicture(picture: widget.picture),
                TimeBar(time: widget.time),
                LikeBar(likesUsername: widget.likesUsername),
                FbReaction(),
                ReactionsBarV2(),

                //comments section
                if (widget.comments != null)
                  for (var i = 0; i < widget.comments![0].length; i++)
                    RenderComments(
                        username: widget.comments![0][i],
                        comments: widget.comments![1][i]),
              ])),

              //bottom section
              Container(
                height: 30,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
