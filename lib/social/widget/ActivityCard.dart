import 'package:fitness_coaching_application_test/social/screen/social_activity_detail_view.dart';
import 'package:fitness_coaching_application_test/social/widget/ActivityFeedPicture.dart';
import 'package:fitness_coaching_application_test/social/widget/ReactionsBar.dart';
import 'package:fitness_coaching_application_test/social/widget/UsernameBar.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ActivityCard extends StatefulWidget {
  final userActivity;
  final userData;

  ActivityCard({Key? key, required this.userActivity, required this.userData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ActivityCardState();
}

class ActivityCardState extends State<ActivityCard> {
  String urls = "";
  String username = "";
  String actHeader = "";
  String actDetail = "";
  int likes = 0;
  int comments = 0;
  String picture = "";
  String updateOn = "";

  void preBuild() {
    setState(() {
      if (widget.userActivity["activityType"] == "LEVEL_UP") {
        actHeader = "Level Up";
        actDetail =
            '${widget.userActivity['userData']['displayName']} has reached level ${widget.userActivity["data"]["level"]}';
        picture = widget.userActivity['userData']['profilePicture'];
      } else if (widget.userActivity["activityType"] == "EXERCISE") {
        actHeader = "Course Complete";
        actDetail = widget.userActivity['course']['name'];
        picture = widget.userActivity['course']['coverPicture'];
      }
      likes = (widget.userActivity["reactions"].length);
      comments = (widget.userActivity["comments"].length);
      var timestamp = DateTime.parse(widget.userActivity['timestamp']);
      updateOn = Jiffy(timestamp).fromNow();
    });
  }

  @override
  Widget build(BuildContext context) {
    preBuild();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ActivityDetail(
                      activityId: widget.userActivity['_id'],
                      currentUserId: widget.userData['_id'],
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(children: [
            UsernameBar(
                imageUrl: widget.userActivity['userData']["profilePicture"],
                username: widget.userActivity['userData']["displayName"],
                userId: widget.userActivity['userData']["_id"]),
            ActivityFeedPicture(
                actHeader: actHeader,
                actDetail: actDetail,
                reactions: widget.userActivity['reactions'],
                comments: widget.userActivity['comments'],
                picture: picture,
                updateOn: updateOn),
            ReactionsBar(
              likeCnt: likes,
              commentCnt: comments,
              updateToNow: updateOn,
              isReacted: widget.userActivity['userReactionsList']
                      [widget.userData["_id"]] !=
                  null,
            )
          ])),
    );
  }
}
