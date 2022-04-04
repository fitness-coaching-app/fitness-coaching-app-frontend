import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/environment.dart';
import 'package:flutter_application_2/homeSection.dart';
import 'package:flutter_application_2/home_view.dart';
import 'package:flutter_application_2/search_see_all_course_view.dart';
import 'package:flutter_application_2/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchingState();
}

class SearchingState extends State<Searching> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Search head section
                          Container(
                            height: 21,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Ionicons.arrow_back,
                                    size: 30,
                                    color: color_dark,
                                  )),
                              Container(
                                width: 20,
                              ),
                              Text("Search",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 26.0),
                                  textAlign: TextAlign.left),
                              Expanded(child: Container()),
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(365),
                                      color: color_dark),
                                  child: Icon(
                                    Ionicons.scan_outline,
                                    color: color_white,
                                    size: 18,
                                  )),
                            ],
                          ),

                          //Search box
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Search for Course or People",
                                  hintStyle: const TextStyle(
                                      color: color_subtitle,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(20),
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Ionicons.search,
                                            size: 25,
                                            color: color_subtitle,
                                          ))),
                                  suffixIcon: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Ionicons.filter_circle_outline,
                                            size: 25,
                                            color: color_subtitle,
                                          )))),
                              controller: searchController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // validator: (String? value) => validateEmail(value),
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: color_lightGrey,
                            ),
                            padding: EdgeInsets.zero,
                          ),

                          //Recent search
                          Text("Recent Searches",
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0),
                              textAlign: TextAlign.left),
                          Container(
                            height: 15,
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Morning Exercise",
                                            style: const TextStyle(
                                                color: color_dark,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            textAlign: TextAlign.left),
                                        Text("Course",
                                            style: const TextStyle(
                                                color: color_subtitle,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.0),
                                            textAlign: TextAlign.left)
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchAllCourse(
                                                        searchText:
                                                            searchController
                                                                .text)),
                                          );
                                        },
                                        child: Icon(
                                          Ionicons.close_outline,
                                          color: color_subtitle,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                        ))
                                  ]))
                        ])))));
  }
}
