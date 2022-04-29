import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/exerciseSummary_view.dart';
import 'color.dart';
import 'components/main_button_highlight.dart';

class ExerciseSumLv extends StatelessWidget {
  final int currentLevel;
  final List<String>? newAchievementsId;
  final String activityId;
  final int score;
  final int duration;
  final int xpEarned;
  const ExerciseSumLv({Key? key,
    required this.currentLevel,
    this.newAchievementsId,
    required this.activityId,
    required this.score,
    required this.duration,
    required this.xpEarned
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                  child: Text("Level Up !",
                      style: const TextStyle(
                          color: color_white,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 32.0),
                      textAlign: TextAlign.center)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 170.0,
                        width: 170.0,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: color_dimmedTeal,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            child: new Center(
                              child: new Text("$currentLevel",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 64.0),
                                  textAlign: TextAlign.center),
                            )),
                      ),
                    ),
                    Container(height: MediaQuery.of(context).size.height * 0.05),
                    Text("Congratulations!\nYou’ve reached level $currentLevel",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              MainButtonHighlight(text: "Continue", onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExerciseSummary(score: score, duration: duration, xpEarned: xpEarned, activityId: activityId)),
                        );
                    }),
              Container(
                //color: Colors.red,
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
