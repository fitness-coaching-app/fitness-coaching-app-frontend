import 'package:fitness_coaching_application_test/social/widget/ActivityFeedPicture.dart';
import 'package:fitness_coaching_application_test/social/widget/ReactionsBar.dart';
import 'package:fitness_coaching_application_test/social/widget/UsernameBar.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatefulWidget {
  final String actHeader;
  final String actDetail;
  final String username;
  final String iconUrl;
  final String urls;
  final List<List<String>> likes;
  final int likeCnt;
  final List<List<String>> comments;
  final int commentCnt;
  final String picture;
  final String onClickAction;
  final String updateOn;
  final String updateToNow;

  ActivityCard({
    Key? key,
    required this.actHeader,
    required this.actDetail,
    required this.username,
    required this.iconUrl,
    required this.urls,
    required this.likes,
    required this.likeCnt,
    required this.comments,
    required this.commentCnt,
    required this.picture,
    required this.onClickAction,
    required this.updateOn,
    required this.updateToNow,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ActivityCardState();
}

class ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(children: [
          UsernameBar(imageUrl: widget.urls, username: widget.username),
          ActivityFeedPicture(
              actHeader: widget.actHeader,
              actDetail: widget.actDetail,
              username: widget.username,
              urls: widget.urls,
              likes: widget.likes,
              comments: widget.comments,
              picture: widget.picture,
              updateOn: widget.updateOn),
          // Container(
          //   child: FbReaction(),
          // ),
          // FbReaction(),
          ReactionsBar(
              likeCnt: widget.likeCnt,
              commentCnt: widget.commentCnt,
              updateToNow: widget.updateToNow)
        ]));
  }
}
