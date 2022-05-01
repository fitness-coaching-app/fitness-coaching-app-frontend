import 'package:fitness_coaching_application_test/components/build_bottom_nav_bar.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/components/thin_button_highlight.dart';
import 'package:fitness_coaching_application_test/components/thin_button_inverted.dart';
import 'package:fitness_coaching_application_test/social/widget/ActivityCard.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/AchievementCard.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/ProfileHead.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/StatsCard.dart';
import 'package:fitness_coaching_application_test/userProfile/widgets/TwoToggleIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';

import '../../api_util.dart';
import '../../color.dart';
import '../../environment.dart';
import '../../loading_view.dart';

class UserPeopleView extends StatefulWidget {
  final String userId;

  UserPeopleView({required this.userId});

  @override
  State<UserPeopleView> createState() => _UserPeopleViewState();
}

class _UserPeopleViewState extends State<UserPeopleView> {
  int option = 1;
  Future? loadProfileFuture;
  Future? loadAchievementFuture;
  Map<String, bool> userAchievementList = {};
  bool follow = false;
  var userData;
  var userActivity;

  void updateAchievementList() {
    userAchievementList = {};
    for (var i in userData['achievement']) {
      userAchievementList[i["achievementId"]] = true;
    }
    print(userAchievementList);
  }

  Future<bool> addFollower() async {
    var response = await API.get('${Environment.addFollowerUrl}',
        withToken: true,
        queryParameters: {"displayName": userData["displayName"]});

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          print(r.message);
        });
    return true;
  }

  Future<bool> removeFollower() async {
    var response = await API.get('${Environment.removeFollowerUrl}',
        withToken: true,
        queryParameters: {"displayName": userData["displayName"]});

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          print(r.message);
        });
    return true;
  }

  Future<bool> loadProfile() async {
    var response =
        await API.get('${Environment.getUserInfoByIdUrl}/${widget.userId}');
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          setState(() {
            userData = r.results!;
          });
        });

    var activity = await API.get(
        '${Environment.activityWithDisplayNameUrl}/${userData["displayName"]}');
    API.responseAlertWhenError(
        context: context,
        response: activity,
        whenSuccess: (r) {
          setState(() {
            userActivity = r.results!;
          });
        });

    var following =
        await API.get('${Environment.getFollowingListUrl}', withToken: true);
    API.responseAlertWhenError(
        context: context,
        response: following,
        whenSuccess: (r) {
          var followingList = r.results!;
          for (var f in followingList) {
            if (f["followingData"][0]["displayName"] ==
                userData["displayName"]) {
              setState(() {
                follow = true;
              });
              break;
            }
          }
        });
    return true;
  }

  @override
  void initState() {
    super.initState();
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
        onRefresh: () async {
          await loadProfile();
          await fetchAchievementsList();
        },
        child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
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
                  numberOfFollowing: userData["followingCount"].toString(),
                  disableFollowListTap: true,
                ),

                Container(
                  height: 20,
                ),
                (() {
                  if (follow) {
                    return ThinButtonInverted(
                        text: 'Following',
                        onPressed: () async {
                          setState(() {
                            follow = false;
                          });
                          await removeFollower();
                          await loadProfile();
                          await fetchAchievementsList();
                        });
                  } else {
                    return ThinButtonHighlight(
                        text: 'Follow',
                        onPressed: () async {
                          setState(() {
                            follow = true;
                          });
                          await addFollower();
                          await loadProfile();
                          await fetchAchievementsList();
                        });
                  }
                }()),

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
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppBar(
          title: userData == null ? "Profile" : userData["displayName"],
          backButton: true,
        ),
        body: FutureBuilder(
            future: loadProfileFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return buildProfile();
              } else {
                return Loading();
              }
            }));
  }
}
