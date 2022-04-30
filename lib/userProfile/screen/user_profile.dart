import 'package:fitness_coaching_application_test/components/build_bottom_nav_bar.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/social/social_activity.dart';
import 'package:fitness_coaching_application_test/social/widget/ActivityCard.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/ProfileHead.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/StatsCard.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/TwoToggleIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';

import '../../api_util.dart';
import '../../color.dart';
import '../../environment.dart';
import '../../loading_view.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int option = 1;
  Future? loadProfileFuture;
  var userData;
  var userActivity;

  Future<bool> loadProfile() async {
    print("loadProfile");
    var response = await API
        .get('${Environment.getUserInfoUrl}',withToken: true);
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          setState(() {
            var user = Hive.box('user');
            user.put('data',r.results!);
            userData = r.results!;
          });
        });

    var activity = await API.get(Environment.userActivityUrl, withToken: true);
    API.responseAlertWhenError(
        context: context,
        response: activity,
        whenSuccess: (r) {
          setState(() {
            userActivity = r.results!;
            var user = Hive.box('user');
            user.put('activity', userActivity);
          });
        });

    return true;
  }

  @override
  void initState() {
    super.initState();

    var user = Hive.box('user');
    userData = user.get('data');
    userActivity = user.get('activity');
    userData['followingCount'] = 0;
    userData['followerCount'] = 0;

    loadProfileFuture = loadProfile();
  }

  Widget buildActivityFeed() {
    List<ActivityCard> activityFeed = [];
    if(userActivity != null){
      for (var i = 0; i < userActivity.length; i++){
        activityFeed.add(ActivityCard(userActivity: userActivity[i], userData: userData));
      }
    }

    return Column(
        children: activityFeed
    );
  }

  Widget buildProfile() {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 21,
          ),
          //profile head section

          //profile picture details
          ProfileHead(
              username: userData["displayName"],
              imageUrl: userData["profilePicture"],
              numberOfFollower: userData["followerCount"].toString(),
              numberOfFollowing: userData["followingCount"].toString()),

          //stats section
          StatsCard(height: "100", weight: "100", bmi: "100", isPrivate: true),

          //news and achievement toggle
          TwoToggleIcons(
              options1: Ionicons.newspaper,
              options2: Ionicons.ribbon,
              onChanged: (option) {
                setState(() {
                  this.option = option;
                });
              }),
          buildActivityFeed(),
          //bottom section
          Container(
            height: 150,
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BuildTopBottomBar(
        page: 'profile',
        appBar: NormalAppBar(
          title: "Profile",
          actionButton: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(365), color: color_dark),
              child: Icon(
                Ionicons.ellipsis_horizontal,
                color: color_white,
                size: 18,
              )),
        ),
        body: buildProfile());
  }
}
