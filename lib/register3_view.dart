import 'package:flutter/material.dart';
import 'package:flutter_application_2/register4_view.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register3 extends StatelessWidget {
  const Register3({Key? key}) : super(key: key);
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
                      'assets/Icon/Cartoon Illustration_man1.svg',
                      height: 100,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pick Your Display Name",
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
                      Text("Pick a display name for your account",
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
                      Container(
                        height: 60,
                        child: TextFormField(
                            decoration: InputDecoration(
                          hintText: "Enter your display name",
                          hintStyle: const TextStyle(
                              color: color_subtitle,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: color_lightGrey),
                        padding: EdgeInsets.zero,
                      ),
                      Container(
                        height: 40,
                      ),
                      // Send Instructions Button
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: new GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register4()),
                                    );
                                  },
                                  child: Container(
                                      height: 60,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.5),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
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
