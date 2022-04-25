import 'package:flutter/material.dart';
import 'WorkoutPortraitMain_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import '../../color.dart';

class WorkoutDetail extends StatelessWidget {
  const WorkoutDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Image.network(
                      "https://frontiersinblog.files.wordpress.com/2021/09/shutterstock_1080117269-edited.jpg",
                      fit: BoxFit.fitHeight)),
              Positioned(
                  top: 21,
                  left: 25,
                  child: new GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Ionicons.arrow_back,
                        size: 30,
                        color: color_dark,
                      ))),
            ],
          ),
          Stack(children: <Widget>[
            Container(
                decoration: new BoxDecoration(color: color_dark),
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Weight Loss Training",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 28.0),
                              textAlign: TextAlign.left),
                          Expanded(child: Container()),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //LTag Duration
                                Container(
                                    height: 50,
                                    width: 75,
                                    decoration: new BoxDecoration(
                                      color: const Color(0xffbd85e9),
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(15)),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/Icon/Miscellaneous-Filled_clock.svg',
                                            height: 16.25,
                                          ),
                                          Expanded(child: Container()),
                                          Container(
                                            child: Text("45 min",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Poppins",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.0),
                                                textAlign: TextAlign.center),
                                          ),
                                        ],
                                      ),
                                    )),
                                Container(
                                  width: 15,
                                ),
                                //LTag Rating
                                Container(
                                    height: 50,
                                    width: 75,
                                    decoration: new BoxDecoration(
                                      color: const Color(0xfff0c016),
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(15)),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/Icon/Miscellaneous-Filled_star.svg',
                                            height: 17.5,
                                          ),
                                          Expanded(child: Container()),
                                          Container(
                                            child: Text("4.8",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Poppins",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.0),
                                                textAlign: TextAlign.center),
                                          ),
                                        ],
                                      ),
                                    )),
                                Container(
                                  width: 15,
                                ),
                                //LTag Difficultlity
                                Container(
                                    height: 50,
                                    width: 75,
                                    decoration: new BoxDecoration(
                                      color: const Color(0xffee9715),
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(15)),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Ionicons.flash,
                                            size: 17.5,
                                            color: color_white,
                                          ),
                                          Expanded(child: Container()),
                                          Container(
                                            child: Text("Medium",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Poppins",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.0),
                                                textAlign: TextAlign.center),
                                          ),
                                        ],
                                      ),
                                    )),
                              ]),
                          Expanded(child: Container()),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                style: const TextStyle(
                                    color: color_lightGrey,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left),
                          ),
                          Expanded(child: Container()),
                          Center(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                Expanded(
                                    child: new GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WorkoutMainView()),
                                          );
                                        },
                                        child: Container(
                                            height: 60,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 16.5),
                                              child: Text("Let’s Go",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Poppins",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 18.0),
                                                  textAlign: TextAlign.center),
                                            ),
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        17, 71, 209, 1),
                                                    Color.fromRGBO(
                                                        170, 26, 193, 1),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))))))
                              ])),
                          Expanded(child: Container())
                        ]))),
          ]),
        ],
      ),
    );
  }
}
