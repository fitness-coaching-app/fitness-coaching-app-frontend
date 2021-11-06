import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/main.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkoutDetail extends StatelessWidget {
  const WorkoutDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(top: 140),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(top: 140),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(top: 140),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(top: 140),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://www.techhub.in.th/wp-content/uploads/2021/05/577280151-1.jpg'))),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(top: 140),
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
                                        builder: (context) => MyHomePage()),
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
            BottomAppBar(
                shape: CircularNotchedRectangle(),
                color: Colors.blue,
                child: IconTheme(
                  data: IconThemeData(
                      color: Theme.of(context).colorScheme.onPrimary),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        tooltip: 'Open navigation menu',
                        icon: const Icon(Icons.menu),
                        onPressed: () {},
                      ),
                      IconButton(
                        tooltip: 'Search',
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                      IconButton(
                        tooltip: 'Favorite',
                        icon: const Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
