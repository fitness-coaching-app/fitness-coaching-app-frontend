import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/environment.dart';
import 'package:flutter_application_2/homeSection.dart';
import 'package:flutter_application_2/home_view.dart';
import 'package:flutter_application_2/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_profile_achieve_view.dart';
import 'user_profile_follower_view.dart';
import 'user_profile_following_view.dart';

class SearchAllCourse extends StatefulWidget {
  final String searchText;
  const SearchAllCourse({Key? key, required this.searchText}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchAllCourseState();
}

class SearchAllCourseState extends State<SearchAllCourse> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    String searchText = widget.searchText;
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
                              Text("Course",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 26.0),
                                  textAlign: TextAlign.left),
                            ],
                          ),

                          //Search result for
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text("Search Result for \"$searchText\"",
                                  style: const TextStyle(
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left)),

                          //Course Section
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: new GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WorkoutDetail()),
                                        );
                                      },
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("TODAY'S PICK",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: "Poppins",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 18),
                                                      textAlign:
                                                          TextAlign.left),
                                                  Container(
                                                      height: ((MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.6) /
                                                          3)),
                                                  Text("Weight Loss Training",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: "Poppins",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 22),
                                                      textAlign:
                                                          TextAlign.left),
                                                  Expanded(
                                                      child: Container(
                                                    height: 5,
                                                  )),
                                                  //time and rated row
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        //times tag
                                                        Container(
                                                            height: 24,
                                                            width: 77,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      220,
                                                                      189,
                                                                      133,
                                                                      233),
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          15)),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/Icon/Miscellaneous-Filled_clock.svg',
                                                                    height: 13,
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Container()),
                                                                  Container(
                                                                    child: Text(
                                                                        "45 min",
                                                                        style: const TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontFamily:
                                                                                "Poppins",
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize:
                                                                                12.0),
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                        Container(width: 10),
                                                        //rated tag
                                                        Container(
                                                            height: 24,
                                                            width: 53,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      220,
                                                                      240,
                                                                      192,
                                                                      22),
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          15)),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/Icon/Miscellaneous-Filled_star.svg',
                                                                    height: 13,
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Container()),
                                                                  Container(
                                                                    child: Text(
                                                                        "4.3",
                                                                        style: const TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontFamily:
                                                                                "Poppins",
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize:
                                                                                12.0),
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ]),
                                                ]),
                                          ))),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("TODAY'S PICK",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Poppins",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 18),
                                                  textAlign: TextAlign.left),
                                              Container(
                                                  height:
                                                      ((MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6) /
                                                          3)),
                                              Text("Weight Loss Training",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Poppins",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 22),
                                                  textAlign: TextAlign.left),
                                              Expanded(
                                                  child: Container(
                                                height: 5,
                                              )),
                                              //time and rated row
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    //times tag
                                                    Container(
                                                        height: 24,
                                                        width: 77,
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Color.fromARGB(
                                                              220,
                                                              189,
                                                              133,
                                                              233),
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/Icon/Miscellaneous-Filled_clock.svg',
                                                                height: 13,
                                                              ),
                                                              Expanded(
                                                                  child:
                                                                      Container()),
                                                              Container(
                                                                child: Text(
                                                                    "45 min",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            12.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                    Container(width: 10),
                                                    //rated tag
                                                    Container(
                                                        height: 24,
                                                        width: 53,
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Color.fromARGB(
                                                              220,
                                                              240,
                                                              192,
                                                              22),
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/Icon/Miscellaneous-Filled_star.svg',
                                                                height: 13,
                                                              ),
                                                              Expanded(
                                                                  child:
                                                                      Container()),
                                                              Container(
                                                                child: Text(
                                                                    "4.3",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            12.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ]),
                                            ]),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ])))));
  }
}
