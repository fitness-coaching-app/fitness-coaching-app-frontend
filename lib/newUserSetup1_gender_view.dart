import 'package:flutter/material.dart';
import 'package:flutter_application_2/newUserSetup2_bd_view.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewUserSetupGender extends StatelessWidget {
  const NewUserSetupGender({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Ionicons.arrow_back,
                      size: 30,
                      color: color_dark,
                    )),
                Container(
                  height: 45,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.4),
                    child: new SvgPicture.asset(
                      'assets/Icon/Cartoon Illustration_genders1.svg',
                      height: 100,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("What’s Your Gender",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 40,
                      ),
                      Container(
                          height: 80,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Ionicons.male,
                                  color: Color.fromRGBO(4, 151, 214, 1),
                                  size: 48,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                // Text
                                Text("Male",
                                    style: const TextStyle(
                                        color: color_dark,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.0),
                                    textAlign: TextAlign.left),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: Colors.teal, width: 3),
                              color: const Color(0xffdcffea))),
                      Container(
                        height: 15,
                      ),
                      Container(
                          height: 80,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Ionicons.female,
                                  color: Color.fromRGBO(255, 72, 226, 1),
                                  size: 48,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                // Text
                                Text("Female",
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
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: color_lightGrey)),
                      Container(
                        height: 15,
                      ),
                      Container(
                          height: 80,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Ionicons.male_female,
                                  size: 48,
                                  color: Color.fromRGBO(184, 12, 244, 1),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                // Text
                                Text("Other",
                                    style: const TextStyle(
                                        color: color_dark,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.0),
                                    textAlign: TextAlign.left),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: color_lightGrey)),
                      Container(
                        height: 40,
                      ),
                      // Next Button
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child:  new GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewUserSetupBd()),
                                );
                              },
                              child: Container(
                                  height: 60,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.5),
                                    child: new Text("Next",
                                        style: const TextStyle(
                                            color: color_dark,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18.0),
                                        textAlign: TextAlign.center),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: color_teal))),
                            )
                          ]),
                    ],
                  ),
                )),
                Expanded(child: Container()),
              ],
            )),
      ),
    );
  }
}
