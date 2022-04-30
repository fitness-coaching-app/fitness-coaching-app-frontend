import 'dart:math';

import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/social/screen/social_activity_view.dart';
import 'package:fitness_coaching_application_test/social/social_leaderboard.dart';
import 'package:fitness_coaching_application_test/social/screen/social_leaderboard_global_view.dart';
import 'package:fitness_coaching_application_test/social/widget/RenderLowerLeaderboard.dart';
import 'package:fitness_coaching_application_test/social/widget/RenderTopThree.dart';
import 'package:fitness_coaching_application_test/social/widget/TwoToggleSwitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ionicons/ionicons.dart';

import '../../api_util.dart';
import '../../loading_view.dart';

class LeaderboardGlobal extends StatefulWidget {
  const LeaderboardGlobal({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LeaderboardGlobalState();
}

class LeaderboardGlobalState extends State<LeaderboardGlobal> {
  TextEditingController searchController = new TextEditingController();
  List<dynamic> leaderboard = [];

  Future? loadLeaderboard;

  Future<bool> fetchLeaderboard() async {
    var response =
        await API.get(Environment.globalLeaderboardUrl, queryParameters: {
      "limit": "100",
      "start": "1",
    });

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          setState((){
            leaderboard = r.results!;
            print(leaderboard.getRange(0, 2).map((e) => e["displayName"]).toList());
          });
        });
    return true;
  }

  @override
  void initState() {
    super.initState();
    loadLeaderboard = fetchLeaderboard();
  }

  Widget buildGlobalLeaderboard() {
    return RefreshIndicator(
      onRefresh: fetchLeaderboard,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // //Top 3 Users
              RenderTopThree(
                  rank: ["1","2","3"],
                  username: leaderboard.getRange(0, 3).map((e) => e["displayName"].toString()).toList(),
                  score: leaderboard.getRange(0, 3).map((e) => e["xp"].toString()).toList(),
                  urls: leaderboard.getRange(0, 3).map((e) => e["profilePicture"].toString()).toList()
              ),

              //4th section
              for (var i = 3; i < leaderboard.length; i++)
                RenderLowerLeaderboard(
                    rank: (i + 1).toString(),
                    username: leaderboard[i]["displayName"],
                    urls: leaderboard[i]["profilePicture"]),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadLeaderboard,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return buildGlobalLeaderboard();
        }
        else{
          return Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SpinKitThreeBounce(color: color_dark, size: 30)),
            );
        }
      }
    );
  }
}
