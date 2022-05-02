import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/CourseCard.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_people_view.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
  List<Widget> usersResultWidget = [];

  void updateCoursesResult() {
    coursesResultWidget = [];
    for (var course in widget.courses) {
      coursesResultWidget.add(CourseCard(
          title: course["name"],
          coverPictureUrl: course["coverPicture"],
          rating: course["overallRating"] * 1.0,
          courseId: course['_id']));
    }
  }

  void updateUsersResult() {
    usersResultWidget = [];
    for (var user in widget.users) {
      usersResultWidget.add(userCard(
          displayName: user["displayName"],
          userId: user["_id"],
          profilePicture:
              user["profilePicture"] == null || user["profilePicture"] == ""
                  ? Environment.noImageUrl
                  : user["profilePicture"]));
    }
    print(usersResultWidget);
  }

  Widget buildTopRow({required title, onTapSeeAll}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(title,
            style: const TextStyle(
                color: color_dark,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 20.0),
            textAlign: TextAlign.left),
        // Expanded(child: Container()),
        // GestureDetector(
        //     onTap: onTapSeeAll,
        //     child: Text("See All",
        //         style: const TextStyle(
        //             color: color_dimmedTeal,
        //             fontWeight: FontWeight.w600,
        //             fontFamily: "Poppins",
        //             fontStyle: FontStyle.normal,
        //             fontSize: 16.0),
        //         textAlign: TextAlign.right))
      ]),
    );
  }

  Widget userCard(
      {required String displayName,
      required String profilePicture,
      required String userId}) {
    return GestureDetector(
      onTap: () {
        var userData = Hive.box('user').get('data');
        if (userData['_id'] == userId) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => UserProfile()),
              (r) => false);
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserPeopleView(userId: userId)));
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(children: [
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(profilePicture == ""
                          ? Environment.noImageUrl
                          : profilePicture)))),
          Container(
            width: 20,
          ),
          Text(displayName,
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left)
        ]),
      ),
    );
  }

  Widget buildCourseSearchResult() {
    if (coursesResultWidget.length == 0) {
      return Container();
    }
    return Column(children: [
      buildTopRow(title: 'Course', onTapSeeAll: () {}),
      SizedBox(height: 10),
      Container(
          height: 220,
          child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25),
              scrollDirection: Axis.horizontal,
              children: coursesResultWidget)),
      SizedBox(height: 20),
    ]);
  }

  Widget buildUserSearchResult() {
    if (usersResultWidget.length == 0) {
      return Container();
    }
    return Column(children: [
      buildTopRow(title: 'User', onTapSeeAll: () {}),
      SizedBox(height: 10),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(children: usersResultWidget)),
      SizedBox(height: 20),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    updateCoursesResult();
    updateUsersResult();
    return Column(
        children: [buildCourseSearchResult(), buildUserSearchResult()]);
  }
}
