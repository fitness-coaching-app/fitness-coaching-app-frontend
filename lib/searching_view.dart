import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/home/homeSection.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/search_see_all_course_view.dart';
import 'package:fitness_coaching_application_test/workoutDetail_view.dart';
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
  RangeValues _currentDurationRangeValues = const RangeValues(0, 60);
  RangeValues _currentRatingRangeValues = const RangeValues(0, 5);
  List<bool> _category = [false, false, false];
  List<bool> _body = [false, false, false];
  List<bool> _others = [false];
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
                              keyboardType: TextInputType.text,
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
                                          onTap: () {
                                            showModalBottomSheet<void>(
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                      builder: (BuildContext
                                                              context,
                                                          StateSetter
                                                              setState /*You can rename this!*/) {
                                                    return SingleChildScrollView(
                                                      child: Container(
                                                        color:
                                                            Color(0xb20c2b42),
                                                        child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(25, 0,
                                                                    25, 25),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Center(
                                                                        child: Icon(
                                                                      Ionicons
                                                                          .remove,
                                                                      size: 50,
                                                                      color:
                                                                          color_white,
                                                                    ))),
                                                                Text("Filters",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            26.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Container(
                                                                  height: 20,
                                                                ),

                                                                //category section
                                                                Text("Category",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(365),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Category 1",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _category[
                                                                              0],
                                                                          value: _category[
                                                                              0],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _category[0] = value!;
                                                                            });
                                                                          }),
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Category 2",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _category[
                                                                              1],
                                                                          value: _category[
                                                                              1],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _category[1] = value!;
                                                                            });
                                                                          }),
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Category 3",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _category[
                                                                              2],
                                                                          value: _category[
                                                                              2],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _category[2] = value!;
                                                                            });
                                                                          })
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 20,
                                                                ),

                                                                //duration section
                                                                Text("Duration",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                RangeSlider(
                                                                  values:
                                                                      _currentDurationRangeValues,
                                                                  max: 60,
                                                                  divisions: 6,
                                                                  activeColor:
                                                                      color_teal,
                                                                  inactiveColor:
                                                                      Color(
                                                                          0xffcbcbcb),
                                                                  labels:
                                                                      RangeLabels(
                                                                    _currentDurationRangeValues
                                                                            .start
                                                                            .round()
                                                                            .toString() +
                                                                        " min",
                                                                    _currentDurationRangeValues
                                                                            .end
                                                                            .round()
                                                                            .toString() +
                                                                        " min",
                                                                  ),
                                                                  onChanged:
                                                                      (RangeValues
                                                                          values) {
                                                                    setState(
                                                                        () {
                                                                      _currentDurationRangeValues =
                                                                          values;
                                                                    });
                                                                  },
                                                                ),
                                                                Container(
                                                                  height: 20,
                                                                ),

                                                                //body parts section
                                                                Text(
                                                                    "Body Parts",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(365),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Body 1",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _body[
                                                                              0],
                                                                          value: _body[
                                                                              0],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _body[0] = value!;
                                                                            });
                                                                          }),
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Body 2",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _body[
                                                                              1],
                                                                          value: _body[
                                                                              1],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _body[1] = value!;
                                                                            });
                                                                          }),
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Body 3",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _body[
                                                                              2],
                                                                          value: _body[
                                                                              2],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _body[2] = value!;
                                                                            });
                                                                          })
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 20,
                                                                ),

                                                                //Rating Section
                                                                Text("Rating",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                RangeSlider(
                                                                  values:
                                                                      _currentRatingRangeValues,
                                                                  max: 5,
                                                                  divisions: 5,
                                                                  activeColor:
                                                                      color_teal,
                                                                  inactiveColor:
                                                                      Color(
                                                                          0xffcbcbcb),
                                                                  labels:
                                                                      RangeLabels(
                                                                    "★ " +
                                                                        _currentRatingRangeValues
                                                                            .start
                                                                            .round()
                                                                            .toString(),
                                                                    "★ " +
                                                                        _currentRatingRangeValues
                                                                            .end
                                                                            .round()
                                                                            .toString(),
                                                                  ),
                                                                  onChanged:
                                                                      (RangeValues
                                                                          values) {
                                                                    setState(
                                                                        () {
                                                                      _currentRatingRangeValues =
                                                                          values;
                                                                    });
                                                                  },
                                                                ),
                                                                Container(
                                                                  height: 20,
                                                                ),

                                                                //others section
                                                                Text("Others",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(365),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      CheckboxListTile(
                                                                          title:
                                                                              const Text(
                                                                            "Show only recomended for you",
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: "Poppins",
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.0),
                                                                          ),
                                                                          controlAffinity: ListTileControlAffinity
                                                                              .leading,
                                                                          activeColor: Colors
                                                                              .green,
                                                                          checkColor: Colors
                                                                              .white,
                                                                          selected: _others[
                                                                              0],
                                                                          value: _others[
                                                                              0],
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              _others[0] = value!;
                                                                            });
                                                                          }),
                                                                      Container(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    );
                                                  });
                                                });
                                          },
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
                                        onTap: () {},
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
