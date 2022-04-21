import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
import 'package:flutter_svg/svg.dart';

class CourseCard extends StatefulWidget {
  final String title;
  final String coverPictureUrl;
  final double rating;

  CourseCard({
    Key? key,
    required this.title,
    required this.coverPictureUrl,
    required this.rating}) : super(key: key);


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
              MaterialPageRoute(builder: (context) => WorkoutDetail()),
            );
          },
          child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://i.pinimg.com/736x/8c/d7/74/8cd7741ce1311c12243bb8b88b253228.jpg'))),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height:
                              ((MediaQuery.of(context).size.width * 0.6) / 3)),
                      Text("Weight Loss Training",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 22),
                          textAlign: TextAlign.left),
                      Expanded(
                          child: Container(
                        height: 5,
                      )),
                      //time and rated row
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //times tag
                            // Container(
                            //     height: 24,
                            //     width: 77,
                            //     decoration: new BoxDecoration(
                            //       color: Color.fromARGB(220, 189, 133, 233),
                            //       borderRadius:
                            //           new BorderRadius.all(Radius.circular(15)),
                            //     ),
                            //     child: Padding(
                            //       padding: EdgeInsets.symmetric(horizontal: 10),
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.start,
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.center,
                            //         children: [
                            //           SvgPicture.asset(
                            //             'assets/Icon/Miscellaneous-Filled_clock.svg',
                            //             height: 13,
                            //           ),
                            //           Expanded(child: Container()),
                            //           Container(
                            //             child: Text("45 min",
                            //                 style: const TextStyle(
                            //                     color: Colors.white,
                            //                     fontWeight: FontWeight.w400,
                            //                     fontFamily: "Poppins",
                            //                     fontStyle: FontStyle.normal,
                            //                     fontSize: 12.0),
                            //                 textAlign: TextAlign.left),
                            //           ),
                            //         ],
                            //       ),
                            //     )),
                            Container(width: 10),
                            //rated tag
                            Container(
                                height: 24,
                                width: 53,
                                decoration: new BoxDecoration(
                                  color: Color.fromARGB(220, 240, 192, 22),
                                  borderRadius:
                                      new BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Icon/Miscellaneous-Filled_star.svg',
                                        height: 13,
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        child: Text(widget.rating.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.0),
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                )),
                          ]),
                    ]),
              ))),
    );
  }
}
