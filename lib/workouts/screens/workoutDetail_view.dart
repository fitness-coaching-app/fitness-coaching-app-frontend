import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/workouts/widgets/lets_go_button.dart';
import 'package:fitness_coaching_application_test/workouts/widgets/quick_detail.dart';
import 'package:flutter/material.dart';
import '../../api_util.dart';
import '../../environment.dart';
import '../../loading_view.dart';
import 'WorkoutPortraitMain_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import '../../color.dart';

class WorkoutDetail extends StatefulWidget {
  final String courseId;

  const WorkoutDetail({Key? key, required this.courseId}) : super(key: key);

  @override
  State<WorkoutDetail> createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  Map<String, dynamic> courseData = {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 365,
                decoration: new BoxDecoration(color: Colors.white),
                child: Stack(
                  children: [
                    Image.network(courseData["coverPicture"],
                        fit: BoxFit.cover),
                    Positioned(left: 0, top: 45, child: FCABackButton())
                  ],
                )),
            Container(
              decoration: new BoxDecoration(color: color_dark),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 50),
                child: Column(
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
                          overallRating:
                              courseData["overallRating"].toString()),
                      SizedBox(height: 15),
                      Text(courseData["description"],
                          style: const TextStyle(
                              color: color_lightGrey,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left),
                      SizedBox(height: 40),
                      LetsGoButton()
                    ]),
              ),
            ),
          ],
        ),
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
