import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/CourseCard.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  final List<dynamic> courses;
  final List<dynamic> users;

  const SearchResult({Key? key, required this.courses, required this.users})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchResultState();
}

class SearchResultState extends State<SearchResult> {
  List<Widget> coursesResultWidget = [];

  void initState() {
    super.initState();

    for (var course in widget.courses) {
      coursesResultWidget.add(CourseCard(
          title: course["name"],
          coverPictureUrl: course["coverPicture"],
          rating: course["overallRating"],
          courseId: course['_id']));
    }
  }

  Widget buildTopRow({required title, required onTapSeeAll}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Course",
          style: const TextStyle(
              color: color_dark,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: 20.0),
          textAlign: TextAlign.left),
      Expanded(child: Container()),
      GestureDetector(
          onTap: () {},
          child: Text("See All",
              style: const TextStyle(
                  color: color_dimmedTeal,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.right))
    ]);
  }

  Widget buildCourseSearchResult() {
    return Column(children: [
      buildTopRow(title: 'Course', onTapSeeAll: () {}),
      SizedBox(height: 10),
      Container(
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 25),
              scrollDirection: Axis.horizontal,
              children: coursesResultWidget))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return buildCourseSearchResult();
  }
}
