import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
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
  final String activityId;
  final String username;
  final String header;
  final String detail;
  final String urls;
  final String picture;
  final List<dynamic> reactions;
  final List<dynamic> comments;
  final DateTime timestamp;

  const ActivityDetail(
      {Key? key,
        required this.activityId,
      required this.username,
      required this.urls,
      required this.picture,
      required this.comments,
      required this.timestamp,
        required this.reactions,
        required this.header,
        required this.detail
      })
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
      appBar: NormalAppBar(
        title: 'Activity',
        backButton: true
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //activity detail
              Container(
                  child: Column(children: [
                UsernameBar(imageUrl: widget.urls, username: widget.username),
                ActivityPicture(
                    picture: widget.picture,
                    header: widget.header,
                    detail: widget.detail
                ),
                TimeBar(time: widget.timestamp),
                // LikeBar(reactions: widget.reactions),
                FbReaction(),
                ReactionsBarV2(
                  activityId: widget.activityId,
                ),

                //comments section
                //   for (var i = 0; i < widget.comments.length; i++)
                //     RenderComments(
                //         username: 'TEST',
                //         comments: 'TEST'
                //     ),
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
