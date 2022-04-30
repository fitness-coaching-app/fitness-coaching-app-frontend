import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/social/screen/social_leaderboard_following_view.dart';
import 'package:fitness_coaching_application_test/social/screen/social_leaderboard_global_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitness_coaching_application_test/social/widget/TwoToggleSwitch.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  int option = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppBar(title: "Leaderboard", backButton: true),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //follower toggle
                      TwoToggleSwitch(
                          context: context,
                          options1: "Following",
                          options2: "Global",
                          onChanged: (option){
                            setState((){
                              this.option = option;
                            });
                          }
                          ),
                      ((){
                        if(option == 1){
                          return LeaderboardFollowing();
                        }
                        else{
                          return LeaderboardGlobal();
                        }
                      }())

                    ]))));
  }
}
