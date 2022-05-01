import 'package:fitness_coaching_application_test/workouts/screens/workoutDetail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseCard extends StatefulWidget {
  final String title;
  final String coverPictureUrl;
  final double rating;
  final String courseId;

  CourseCard(
      {Key? key,
      required this.title,
      required this.coverPictureUrl,
      required this.rating,
      required this.courseId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CourseCardState();
}

class CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      WorkoutDetail(courseId: widget.courseId)),
            );
          },
          child: Container(
              width: 220,
              height: 220,
              padding: new EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.coverPictureUrl))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 22,
                            shadows: [
                              Shadow(
                                offset: Offset(0.0, 0.0),
                                blurRadius: 60,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              )
                            ]),
                        textAlign: TextAlign.left),

                    SizedBox(height: 10),
                    //rated tag
                    Container(
                        height: 24,
                        width: 53,
                        decoration: new BoxDecoration(
                          color: Color.fromARGB(220, 240, 192, 22),
                          borderRadius:
                              new BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Icon/Miscellaneous-Filled_star.svg',
                                height: 13,
                              ),
                              Expanded(child: Container()),
                              Container(
                                child: Text(widget.rating.toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    textAlign: TextAlign.left),
                              )
                            ],
                          ),
                        )),
                  ]))),
    );
  }
}
