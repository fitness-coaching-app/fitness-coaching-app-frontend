import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/signIn_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword1 extends StatelessWidget {
  const ForgotPassword1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                ),
                Container(
                  height: 45,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.4),
                    child: new SvgPicture.asset(
                      'assets/Icon/Cartoon Illustration2.svg',
                      height: 100,
                    ),
                  ),
                ),
                Container(
                  height: 42.9,
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email has been sent!",
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
                      Text(
                          "We have sent a password reset instruction to your email.",
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
                      // Next Button
                      MainButtonHighlight(
                          text: "Sign In Again",
                          onPressed: () {
                            Navigator.popUntil(
                                context, ModalRoute.withName("/SignIn"));
                          })
                    ],
                  ),
                )),
              ],
            )),
      ),
    );
  }
}
