import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/exerciseSummary/widget/rating_button.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import '../../api_util.dart';
import '../../color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseSummary extends StatefulWidget {
  final int score;
  final int xpEarned;
  final int duration;
  final String activityId;
  final String courseId;

  const ExerciseSummary(
      {Key? key,
      required this.score,
      required this.xpEarned,
      required this.duration,
      required this.activityId,
      required this.courseId})
      : super(key: key);

  @override
  State<ExerciseSummary> createState() => _ExerciseSummaryState();
}

class _ExerciseSummaryState extends State<ExerciseSummary> {
  int courseRating = 0;
  ButtonStatus doneButton = ButtonStatus.active;

  Future<void> sendPostExercise() async {
    setState(() {
      doneButton = ButtonStatus.loading;
    });
    Map<String, dynamic> requestBody = {
      "courseId": widget.courseId,
      "activityId": widget.activityId,
      "isPublic": true,
      "courseRating": courseRating > 0 ? courseRating : null
    };
    var response = await API.post(Environment.postExerciseUrl, requestBody,
        withToken: true);
    setState(() {
      doneButton = ButtonStatus.active;
    });

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Home()), (r) => false);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Exercise Summary",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 30,
                      ),
                      Text("Course Score",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 30,
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 155.0,
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    width: 155,
                                    height: 155,
                                    child: new CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          color_purple),
                                      backgroundColor: color_lightGrey,
                                      value: (widget.score / 100),
                                      strokeWidth: 7,
                                    ),
                                  ),
                                ),
                                Center(
                                    child: Text("${widget.score} %",
                                        style: const TextStyle(
                                            color: color_purple,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 40.0),
                                        textAlign: TextAlign.center)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 35,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("XP Earned",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.left),
                            Expanded(child: Container()),
                            Text("${widget.xpEarned}",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 32.0),
                                textAlign: TextAlign.right),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Time",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.left),
                            Expanded(child: Container()),
                            Text(
                                "${Duration(seconds: widget.duration).inMinutes.toString().padLeft(2, "0")}:${Duration(seconds: widget.duration).inSeconds.remainder(60).toString().padLeft(2, "0")}",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 32.0),
                                textAlign: TextAlign.right),
                          ]),
                      Container(
                        height: 20,
                      ),
                      Text("Rate this Course",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 10,
                      ),
                      RatingButton(onChanged: (rating) {
                        setState(() {
                          courseRating = rating;
                        });
                      })
                    ],
                  ),
                )),
                Expanded(child: Container()),
                MainButtonHighlight(text: "Done", onPressed: sendPostExercise),
                Expanded(child: Container()),
              ],
            )),
      ),
    );
  }
}
