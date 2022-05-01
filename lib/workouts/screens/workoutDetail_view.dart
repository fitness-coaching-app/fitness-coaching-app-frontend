import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/workouts/widgets/lets_go_button.dart';
import 'package:fitness_coaching_application_test/workouts/widgets/quick_detail.dart';
import 'package:flutter/material.dart';

import '../../api_util.dart';
import '../../color.dart';
import '../../environment.dart';
import '../../loading_view.dart';
import 'WorkoutPortraitMain_view.dart';

class WorkoutDetail extends StatefulWidget {
  final String courseId;

  const WorkoutDetail({Key? key, required this.courseId}) : super(key: key);

  @override
  State<WorkoutDetail> createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  Map<String, dynamic> courseData = {
    'courseId': "",
    'name': "",
    'description': "",
    'overallRating': "",
    'difficulty': "",
    'coverPicture': "",
    'courseData': "",
  };
  late final Future? workoutDetailFuture;

  @override
  void initState() {
    super.initState();
    workoutDetailFuture = getWorkoutData();
  }

  Future<String> getWorkoutData() async {
    var response =
        await API.get('${Environment.getCourseByIdUrl}/${widget.courseId}');
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          setState(() {
            courseData["courseId"] = r.results!["_id"];
            courseData["name"] = r.results!["name"];
            courseData["description"] = r.results!["description"];
            courseData["overallRating"] = r.results!["overallRating"] == null
                ? 0.0
                : r.results!["overallRating"];
            courseData["difficulty"] = r.results!["difficulty"];
            courseData["coverPicture"] = r.results!["coverPicture"];
            courseData["courseData"] = r.results!["courseData"];
          });

          print(courseData);
        });
    return "true";
  }

  Widget buildWorkoutDetail() {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(courseData["coverPicture"]),
                          fit: BoxFit.cover,
                        ))),
                    Positioned(top: 50, left: 25, child: FCABackButton()),
                  ],
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.4),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                    decoration: new BoxDecoration(color: color_dark),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(courseData["name"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 28.0),
                              textAlign: TextAlign.left),
                          SizedBox(height: 15),
                          QuickDetail(
                              difficulty: courseData["difficulty"],
                              overallRating: courseData["overallRating"]
                                  .toStringAsFixed(1)),
                          SizedBox(height: 15),
                          Text(courseData["description"],
                              style: const TextStyle(
                                  color: color_lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left),
                          SizedBox(height: 100),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: _screenSize.height - 90,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 25,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: LetsGoButton(onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkoutMainView(
                              courseId: courseData['courseId'],
                              courseDataUrl: courseData['courseData'])),
                      (route) => false);
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: workoutDetailFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return buildWorkoutDetail();
        } else {
          return Loading();
        }
      },
    );
  }
}
