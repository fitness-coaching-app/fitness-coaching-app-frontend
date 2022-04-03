import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/environment.dart';
import 'package:flutter_application_2/homeSection.dart';
import 'package:flutter_application_2/workoutDetail_view.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<void> getUserInfo(String accessToken) async {
    var url = Uri.parse(Environment.getSectionsUrl);
    var response = await http
        .get(url, headers: {"Authorization": "Bearer " + accessToken});
    // var _dataFromAPI = json.decode(response.body);
    List<HomeSection> _homeData = [];
    print(response.body);
    // for (var i in _dataFromAPI) {
    //   HomeSection homeSection = HomeSection(
    //       code: i["code"],
    //       message: i["message"],
    //       error: i["error"],
    //       results: i["results"]);
    //   //Adding user to the list.
    //   _homeData.add(homeSection);
    // }
    // print(response.body);
    // print("*********");
    // print(_homeData);
  }

  @override
  Widget build(BuildContext context) {
    getUserInfo(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiYWNjZXNzVG9rZW4iLCJkaXNwbGF5TmFtZSI6InBvcmFtZWUiLCJpYXQiOjE2NDcwOTA4MzIsImV4cCI6MTY0NzA5MTQzMn0.SOp4edUaiWYsYbnlYEhIS7Tj25o3VgQl1eK3uYYnrkA");
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 21, 25, 0),
                      child: Text("Hello, Robert!",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left),
                    ),
                    Expanded(child: Container()),
                    Padding(
                        padding: EdgeInsets.fromLTRB(25, 21, 25, 0),
                        child: SvgPicture.asset(
                          'assets/Icon/Button_search.svg',
                          height: 40,
                        )),
                  ],
                ),
                Container(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text("Good Morning.",
                      style: const TextStyle(
                          color: color_subtitle,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 200.0,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: ListWheelScrollView.useDelegate(
                          itemExtent: MediaQuery.of(context).size.width * 0.8,
                          diameterRatio: 7,
                          childDelegate: ListWheelChildLoopingListDelegate(
                            children: <Widget>[
                              RotatedBox(
                                  quarterTurns: 1,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                      child: Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 140),
                                        child: Text("Weight Loss Training 1",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.0),
                                            textAlign: TextAlign.left),
                                      )),
                                    ),
                                  )),
                              RotatedBox(
                                  quarterTurns: 1,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                      child: Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 140),
                                        child: Text("Weight Loss Training 2",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.0),
                                            textAlign: TextAlign.left),
                                      )),
                                    ),
                                  )),
                              RotatedBox(
                                  quarterTurns: 1,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                      child: Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 140),
                                        child: Text("Weight Loss Training 3",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.0),
                                            textAlign: TextAlign.left),
                                      )),
                                    ),
                                  )),
                              RotatedBox(
                                  quarterTurns: 1,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                      child: Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 140),
                                        child: Text("Weight Loss Training 4",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.0),
                                            textAlign: TextAlign.left),
                                      )),
                                    ),
                                  )),
                              RotatedBox(
                                  quarterTurns: 1,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                      child: Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 140),
                                        child: Text("Weight Loss Training 5",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.0),
                                            textAlign: TextAlign.left),
                                      )),
                                    ),
                                  )),
                            ],
                          )),
                    )),
                //popular workouts
                Padding(
                    padding: const EdgeInsets.fromLTRB(20.6, 20, 20.6, 0),
                    child: Text("Popular Workouts",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.left)),
                // card popular workouts
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.width * 0.6,
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
                                    builder: (context) => WorkoutDetail()),
                              );
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
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
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18),
                                            textAlign: TextAlign.left),
                                        Container(
                                            height: ((MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6) /
                                                3)),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //times tag
                                              Container(
                                                  height: 24,
                                                  width: 77,
                                                  decoration: new BoxDecoration(
                                                    color: Color.fromARGB(
                                                        220, 189, 133, 233),
                                                    borderRadius:
                                                        new BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
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
                                                            child: Container()),
                                                        Container(
                                                          child: Text("45 min",
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
                                                  decoration: new BoxDecoration(
                                                    color: Color.fromARGB(
                                                        220, 240, 192, 22),
                                                    borderRadius:
                                                        new BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
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
                                                            child: Container()),
                                                        Container(
                                                          child: Text("4.3",
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
                                ))),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("TODAY'S PICK",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18),
                                        textAlign: TextAlign.left),
                                    Container(
                                        height: ((MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6) /
                                            3)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          //times tag
                                          Container(
                                              height: 24,
                                              width: 77,
                                              decoration: new BoxDecoration(
                                                color: Color.fromARGB(
                                                    220, 189, 133, 233),
                                                borderRadius:
                                                    new BorderRadius.all(
                                                        Radius.circular(15)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Icon/Miscellaneous-Filled_clock.svg',
                                                      height: 13,
                                                    ),
                                                    Expanded(
                                                        child: Container()),
                                                    Container(
                                                      child: Text("45 min",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12.0),
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
                                              decoration: new BoxDecoration(
                                                color: Color.fromARGB(
                                                    220, 240, 192, 22),
                                                borderRadius:
                                                    new BorderRadius.all(
                                                        Radius.circular(15)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Icon/Miscellaneous-Filled_star.svg',
                                                      height: 13,
                                                    ),
                                                    Expanded(
                                                        child: Container()),
                                                    Container(
                                                      child: Text("4.3",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12.0),
                                                          textAlign:
                                                              TextAlign.left),
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
                //just for you
                Padding(
                    padding: const EdgeInsets.fromLTRB(20.6, 20, 20.6, 0),
                    child: Text("Just For You",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.left)),
                // card popular workouts
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.width * 0.6,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18),
                                        textAlign: TextAlign.left),
                                    Container(
                                        height: ((MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6) /
                                            3)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          //times tag
                                          Container(
                                              height: 24,
                                              width: 77,
                                              decoration: new BoxDecoration(
                                                color: Color.fromARGB(
                                                    220, 189, 133, 233),
                                                borderRadius:
                                                    new BorderRadius.all(
                                                        Radius.circular(15)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Icon/Miscellaneous-Filled_clock.svg',
                                                      height: 13,
                                                    ),
                                                    Expanded(
                                                        child: Container()),
                                                    Container(
                                                      child: Text("45 min",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12.0),
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
                                              decoration: new BoxDecoration(
                                                color: Color.fromARGB(
                                                    220, 240, 192, 22),
                                                borderRadius:
                                                    new BorderRadius.all(
                                                        Radius.circular(15)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Icon/Miscellaneous-Filled_star.svg',
                                                      height: 13,
                                                    ),
                                                    Expanded(
                                                        child: Container()),
                                                    Container(
                                                      child: Text("4.3",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12.0),
                                                          textAlign:
                                                              TextAlign.left),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ]),
                                  ]),
                            )),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18),
                                        textAlign: TextAlign.left),
                                    Container(
                                        height: ((MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6) /
                                            3)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          //times tag
                                          Container(
                                              height: 24,
                                              width: 77,
                                              decoration: new BoxDecoration(
                                                color: Color.fromARGB(
                                                    220, 189, 133, 233),
                                                borderRadius:
                                                    new BorderRadius.all(
                                                        Radius.circular(15)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Icon/Miscellaneous-Filled_clock.svg',
                                                      height: 13,
                                                    ),
                                                    Expanded(
                                                        child: Container()),
                                                    Container(
                                                      child: Text("45 min",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12.0),
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
                                              decoration: new BoxDecoration(
                                                color: Color.fromARGB(
                                                    220, 240, 192, 22),
                                                borderRadius:
                                                    new BorderRadius.all(
                                                        Radius.circular(15)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Icon/Miscellaneous-Filled_star.svg',
                                                      height: 13,
                                                    ),
                                                    Expanded(
                                                        child: Container()),
                                                    Container(
                                                      child: Text("4.3",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12.0),
                                                          textAlign:
                                                              TextAlign.left),
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
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: BottomAppBar(
                    color: Color(0xffffffff),
                    child: Container(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Home',
                                  icon: const Icon(
                                    Ionicons.home,
                                    color: color_dark,
                                  ),
                                  onPressed: () {},
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: color_teal,
                                )
                              ]),
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Search',
                                  icon: const Icon(Ionicons.globe_outline,
                                      color: color_dark),
                                  onPressed: () {},
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: color_white,
                                )
                              ]),
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Community',
                                  icon: const Icon(Ionicons.people_outline,
                                      color: color_dark),
                                  onPressed: () {},
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: color_white,
                                )
                              ]),
                          Expanded(child: Container()),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Profile',
                                  icon: const Icon(
                                      Ionicons.person_circle_outline,
                                      color: color_dark),
                                  onPressed: () {},
                                ),
                                Container(
                                  height: 3,
                                  width: 20,
                                  color: color_white,
                                )
                              ]),
                          Expanded(child: Container()),
                        ],
                      ),
                    )))));
  }
}
