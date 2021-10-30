import 'package:flutter/material.dart';
import 'package:flutter_application_2/register2_view.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://mpics.mgronline.com/pics/Images/564000009138801.JPEG'))),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 140),
                        child: Text("Weight Loss Training",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://mpics.mgronline.com/pics/Images/564000009138801.JPEG'))),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 140),
                        child: Text("Weight Loss Training",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://mpics.mgronline.com/pics/Images/564000009138801.JPEG'))),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 140),
                        child: Text("Weight Loss Training",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://mpics.mgronline.com/pics/Images/564000009138801.JPEG'))),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 140),
                        child: Text("Weight Loss Training",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://mpics.mgronline.com/pics/Images/564000009138801.JPEG'))),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 140),
                        child: Text("Weight Loss Training",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      )),
                    ),
                  ),
                ],
              ),
            ),
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
                                    'https://mpics.mgronline.com/pics/Images/564000009138801.JPEG'))),
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
                                    height:
                                        ((MediaQuery.of(context).size.width *
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
                                Container(
                                  height: 5,
                                ),
                                //time and rated row
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                            borderRadius: new BorderRadius.all(
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
                                                Expanded(child: Container()),
                                                Container(
                                                  child: Text("45 min",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Poppins",
                                                          fontStyle:
                                                              FontStyle.normal,
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
                                            borderRadius: new BorderRadius.all(
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
                                                Expanded(child: Container()),
                                                Container(
                                                  child: Text("4.3",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Poppins",
                                                          fontStyle:
                                                              FontStyle.normal,
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
                                    'https://mpics.mgronline.com/pics/Images/564000009138801.JPEG'))),
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
                                    height:
                                        ((MediaQuery.of(context).size.width *
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
                                Container(
                                  height: 5,
                                ),
                                //time and rated row
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                            borderRadius: new BorderRadius.all(
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
                                                Expanded(child: Container()),
                                                Container(
                                                  child: Text("45 min",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Poppins",
                                                          fontStyle:
                                                              FontStyle.normal,
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
                                            borderRadius: new BorderRadius.all(
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
                                                Expanded(child: Container()),
                                                Container(
                                                  child: Text("4.3",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Poppins",
                                                          fontStyle:
                                                              FontStyle.normal,
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
    ));
  }
}
