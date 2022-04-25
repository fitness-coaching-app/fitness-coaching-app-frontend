import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/social/screen/social_activity_view.dart';
import 'package:fitness_coaching_application_test/social/social_leaderboard.dart';
import 'package:fitness_coaching_application_test/social/screen/social_leaderboard_global_view.dart';
import 'package:fitness_coaching_application_test/social/widget/RenderLowerLeaderboard.dart';
import 'package:fitness_coaching_application_test/social/widget/RenderTopThree.dart';
import 'package:fitness_coaching_application_test/social/widget/TwoToggleSwitch.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeaderboardFollowing extends StatefulWidget {
  const LeaderboardFollowing({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LeaderboardFollowingState();
}

class LeaderboardFollowingState extends State<LeaderboardFollowing> {
  TextEditingController searchController = new TextEditingController();
  List<String> rank = [];
  List<String> username = [];
  List<String> score = [];
  List<String> urls = [];
  final leaderboard = leaderboardFromJson(
      "\{\"results\": \[\{\"rank\": 1,\"username\": \"test1\",\"score\": 25330,\"url\": \"https://i.pinimg.com/474x/7c/4d/15/7c4d1533480bb4c5911d95699fef5186.jpg\"\},\{\"rank\": 2,\"username\": \"test2\",\"score\": 25000,\"url\": \"https://news.artnet.com/app/news-upload/2019/01/Cat-Photog-Feat-256x256.jpg\"\},\{\"rank\": 3,\"username\": \"test3\",\"score\": 12345,\"url\": \"https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg\"\},\{\"rank\": 4,\"username\": \"test4\",\"score\": 5432,\"url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC4q5-ZpLXcl_Cd8j_PONvAQC1l7pVX35u6w&usqp=CAU\"\},\{\"rank\": 5,\"username\": \"test5\",\"score\": 1234,\"url\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5YkEJmFjWNPbIANu5itMzRPLZabNlPIkoQ&usqp=CAU\"\}\]\}");
  @override
  Widget build(BuildContext context) {
    for (var i in leaderboard.results) {
      rank.add(i.rank.toString());
      username.add(i.username.toString());
      score.add(i.score.toString());
      urls.add(i.url.toString());
    }
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Search head section
                          Container(
                            height: 21,
                          ),
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
                              Text("Leaderboard",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 26.0),
                                  textAlign: TextAlign.left),
                              Expanded(child: Container()),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Activity()));
                                  },
                                  child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(365),
                                          color: Color(0xcce3e3e3)),
                                      child: Icon(
                                        Ionicons.newspaper,
                                        color: color_dark,
                                        size: 23,
                                      ))),
                            ],
                          ),

                          //follower toggle
                          TwoToggleSwitch(
                              context: context,
                              options1: "Following",
                              options2: "Global",
                              screenTo: LeaderboardGlobal(),
                              selectOptn1: true),

                          //Top 3 Users
                          RenderTopThree(
                              rank: rank,
                              username: username,
                              score: score,
                              urls: urls),

                          //4th section
                          for (var i = 3; i < rank.length; i++)
                            RenderLowerLeaderboard(
                                rank: rank[i],
                                username: username[i],
                                urls: urls[i])
                        ])))));
  }
}
