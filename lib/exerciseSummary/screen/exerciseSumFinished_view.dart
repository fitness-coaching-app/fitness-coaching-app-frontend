import 'package:fitness_coaching_application_test/api_util.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/exerciseSummary/screen/exerciseSumLv_view.dart';
import '../../color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'exerciseSummary_view.dart';
import '../../loading_view.dart';

class ExerciseSumFinished extends StatefulWidget {
  final String courseId;
  final int duration;
  final int score;

  const ExerciseSumFinished({Key? key, required this.courseId, required this.duration, required this.score}) : super(key: key);

  @override
  State<ExerciseSumFinished> createState() => _ExerciseSumFinishedState();
}

class _ExerciseSumFinishedState extends State<ExerciseSumFinished> {
  Future? sendExerciseDataFuture;
  List<String> newAchievementsId = [];
  bool levelUp = false;
  int currentLevel = 0;
  int xpEarned = 0;
  String activityId = "";
  Future<bool> sendExerciseData() async {
    var requestBody = {
      'isPublic': true,
      'courseId': widget.courseId,
      'duration': widget.duration,
      'calories': 0,
      'score': widget.score,
      'poseData': {}
    };
    var response = await API.post(Environment.exerciseCompleteUrl, requestBody, withToken: true);
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r){
          print(r.results);
          levelUp = r.results!["levelUp"];
          currentLevel = r.results!["currentLevel"];
          xpEarned = r.results!["xpEarned"];
          activityId = r.results!["activityId"];
          newAchievementsId = (r.results!["newAchievementsId"] as List<dynamic>).map((e) => e as String).toList();
        });
    return true;
  }
  @override
  void initState(){
    super.initState();
    sendExerciseDataFuture = sendExerciseData();
  }
  Widget buildView(){
    return Scaffold(
          backgroundColor: color_dark,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(height: MediaQuery.of(context).size.height * 0.05),
                  Center(
                      child: Text("COURSE\nCOMPLETED !",
                          style: const TextStyle(
                              color: color_white,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 32.0),
                          textAlign: TextAlign.center)),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: color_white, shape: BoxShape.circle),
                      width: 220,
                      height: 220,
                      child: Center(
                        child: Container(
                          height: 110,
                          child: new SvgPicture.asset(
                            'assets/Icon/Cartoon Illustration_cheers.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  MainButtonHighlight(text: "Continue", onPressed: () {
                    if(levelUp){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExerciseSumLv(
                              courseId: widget.courseId,
                                score: widget.score,
                                duration: widget.duration,
                                xpEarned: xpEarned,
                                currentLevel: currentLevel,
                                newAchievementsId: newAchievementsId,
                                activityId: activityId
                            )),
                      );
                    }
                    // else if(newAchievementsId.isNotEmpty){
                    //   Navigator.push(x
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ExerciseSumLv(currentLevel: currentLevel, newAchievementsId: newAchievementsId)),
                    //   );
                    // }
                    else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExerciseSummary(
                                courseId: widget.courseId,
                                score: widget.score,
                                duration: widget.duration,
                                xpEarned: xpEarned,
                                activityId: activityId)),
                      );
                    }
                  }),
                  Container(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sendExerciseDataFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return buildView();
        }
        else{
          return Loading();
        }
      }
    );
  }
}
