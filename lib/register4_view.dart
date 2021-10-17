import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Ionicons.arrow_back,
                  size: 30,
                  color: color_dark,
                ),
                Container(
                  height: 45,
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add your Profile Picture",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 26.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 5,
                      ),
                      Text("Pick a profile picture for your account",
                          style: const TextStyle(
                              color: color_subtitle,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                      Container(
                        height: 40,
                      ),
                      Center(child:Container(
                          width: 170,
                          height: 170,
                          decoration:
                              BoxDecoration(color: const Color(0xffc4c4c4)))),
                      Container(
                        height: 40,
                      ),
                      // Button
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
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
                                      color: color_teal)),
                            )
                          ]),
                      Container(
                        height: 20,
                      ),
                      Center(child:Text("Skip for Now",
                          style: const TextStyle(
                              color: color_dimmedTeal,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.center))
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
