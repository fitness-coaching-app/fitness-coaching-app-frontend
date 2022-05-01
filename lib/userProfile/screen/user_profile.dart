import 'package:fitness_coaching_application_test/components/build_bottom_nav_bar.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/social/widget/ActivityCard.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/AchievementCard.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/ProfileHead.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/TwoToggleIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';

import '../../api_util.dart';
import '../../color.dart';
import '../../environment.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int option = 1;
  Future? loadProfileFuture;
  Future? loadAchievementFuture;
  Map<String, bool> userAchievementList = {};
  var userData;
  var userActivity;

  void updateAchievementList() {
    userAchievementList = {};
    for (var i in userData['achievement']) {
      userAchievementList[i["achievementId"]] = true;
    }
    print(userAchievementList);
  }

  Future<bool> loadProfile() async {
    print("loadProfile");
    var response =
        await API.get('${Environment.getUserInfoUrl}', withToken: true);
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          setState(() {
            var user = Hive.box('user');
            user.put('data', r.results!);
            userData = r.results!;
            // updateAchievementList();
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
    if (userActivity != null) {
      for (var i = 0; i < userActivity.length; i++) {
        activityFeed.add(
            ActivityCard(userActivity: userActivity[i], userData: userData));
      }
    }

    return Column(children: activityFeed);
  }

  Future<dynamic> fetchAchievementsList() async {
    var response = await API.get(Environment.achievementListUrl);
    var achievementList = [];
    updateAchievementList();
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          achievementList = r.results!;
        });
    return achievementList;
  }

  Widget buildAchievementTile(dynamic achievementList) {
    List<Widget> toReturn = [];
    List<Widget> tempRow = [];

    for (var i in achievementList) {
      tempRow.add(AchievementCard(
        header: i["title"],
        description: i["description"],
        imageUrl: i["picture"],
        received: userAchievementList[i["_id"]] != null,
      ));
      if (tempRow.length == 2) {
        toReturn.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tempRow));
        tempRow = [];
      }
    }
    if (tempRow.isNotEmpty) {
      toReturn.add(Row(children: tempRow));
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(children: toReturn),
    );
  }

  Widget buildAchievement() {
    loadAchievementFuture = fetchAchievementsList();
    return FutureBuilder(
        future: loadAchievementFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return buildAchievementTile(snapshot.data);
          } else {
            return Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SpinKitThreeBounce(color: color_dark, size: 30)),
            );
          }
        });
  }

  Widget buildProfile() {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: RefreshIndicator(
        edgeOffset: 90,
        onRefresh: () async {
          await loadProfile();
          await fetchAchievementsList();
        },
        child: SingleChildScrollView(
            child: SafeArea(
          bottom: false,
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
              // StatsCard(
              //     height: "100", weight: "100", bmi: "100", isPrivate: true),

              //news and achievement toggle
              TwoToggleIcons(
                  options1: Ionicons.newspaper,
                  options2: Ionicons.ribbon,
                  onChanged: (option) {
                    setState(() {
                      this.option = option;
                    });
                  }),
              (() {
                if (option == 1) {
                  return buildActivityFeed();
                } else
                  return buildAchievement();
              }()),
              //bottom section
              Container(
                height: 150,
              ),
            ],
          ),
        )),
      ),
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
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: color_dark),
              child: Icon(
                Ionicons.ellipsis_horizontal,
                color: color_white,
                size: 18,
              )),
        ),
        body: buildProfile());
  }
}
