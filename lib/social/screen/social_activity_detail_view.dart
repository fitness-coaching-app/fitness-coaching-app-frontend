import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:fitness_coaching_application_test/social/widget/ActivityPicture.dart';
import 'package:fitness_coaching_application_test/social/widget/ReactionsBarV2.dart';
import 'package:fitness_coaching_application_test/social/widget/RenderComments.dart';
import 'package:fitness_coaching_application_test/social/widget/TimeBar.dart';
import 'package:fitness_coaching_application_test/social/widget/UsernameBar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../api_util.dart';
import '../../environment.dart';
import '../../loading_view.dart';

class ActivityDetail extends StatefulWidget {
  final String activityId;
  final String currentUserId;

  const ActivityDetail(
      {Key? key, required this.activityId, required this.currentUserId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ActivityDetailState();
}

class ActivityDetailState extends State<ActivityDetail> {
  Future? loadActivityFuture;
  var activity;
  String activityPicture = "";
  String header = "";
  String detail = "";
  TextEditingController commentController = new TextEditingController();

  Future<bool> loadActivity() async {
    var response = await API.get(
        Environment.getSpecificActivityUrl(activityId: widget.activityId),
        withToken: true);

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          activity = r.results!;
          setState(() {
            if (activity['activityType'] == 'EXERCISE') {
              print(activity);
              activityPicture = activity['course']['coverPicture'];
              header = "Course Complete";
              detail = activity['course']['name'];
            } else if (activity['activityType'] == 'LEVEL_UP') {
              activityPicture = activity['userData']['profilePicture'];
              header = "Level Up";
              detail =
                  '${activity['userData']['displayName']} has reached level ${activity['data']['level'].toString()}';
            }
          });
        },
        whenError: (l) {
          Navigator.of(context).pop();
        });
    return true;
  }

  Future<void> addComment() async {
    var response = await API.post(
        Environment.addCommentUrl(activityId: widget.activityId),
        {"comment": commentController.text},
        withToken: true);
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) async {
          await loadActivity();
        });
  }

  @override
  void initState() {
    super.initState();
    loadActivityFuture = loadActivity();
  }

  Widget buildActivityView() {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
      child: Stack(
        children: [
          RefreshIndicator(
            edgeOffset: 90,
            onRefresh: loadActivity,
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //activity detail
                      UsernameBar(
                          imageUrl: activity['userData']['profilePicture'],
                          username: activity['userData']['displayName']),
                      ActivityPicture(
                          picture: activityPicture,
                          header: header,
                          detail: detail),
                      TimeBar(
                          time:
                              DateTime.parse(activity['timestamp']).toLocal()),
                      // LikeBar(reactions: widget.reactions),
                      // FbReaction(),
                      ReactionsBarV2(
                          activityId: widget.activityId,
                          reactionCount: activity['reactions'].length,
                          commentCount: activity['comments'].length,
                          isReacted: activity['userReactionsList']
                                  [widget.currentUserId] !=
                              null,
                          onUpdate: loadActivity),

                      // comments section
                      for (var i in activity['comments'])
                        RenderComments(
                          profilePicture: activity['userCommentsList']
                              [i["userId"]!]["profilePicture"]!,
                          username: activity['userCommentsList'][i["userId"]!]
                              ["displayName"]!,
                          comments: i["comment"],
                        ),
                      Container(
                        height: 60,
                      ),
                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: TextBox(
                hintText: "Write a comment...",
                controller: commentController,
                suffixIcon: GestureDetector(
                    onTap: () {
                      addComment();
                      setState(() {
                        commentController.text = "";
                      });
                    },
                    child: Icon(
                      Ionicons.send,
                      size: 25,
                      color: color_dark,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: NormalAppBar(title: 'Activity', backButton: true),
        body: FutureBuilder(
          future: loadActivityFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return buildActivityView();
            } else {
              return Loading();
            }
          },
        ));
  }
}
