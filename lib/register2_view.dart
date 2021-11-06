import 'package:flutter/material.dart';
import 'package:flutter_application_2/register3_view.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register2 extends StatelessWidget {
  const Register2({Key? key}) : super(key: key);
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
                  height: 45,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.4),
                    child: new GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register3()),
                                  );
                                },
                                child: SvgPicture.asset(
                      'assets/Icon/Cartoon Illustration_email1.svg',
                      height: 100,
                    )),
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
                      Text("Verify your email",
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
                          "Account verification link has been sent to your email address:\ntes***aaa@gmail.com",
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
                      // Didn’t have account? Register
                      Center(
                          child: new GestureDetector(
                              onTap: () {},
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    style: const TextStyle(
                                        color: color_dark,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    text: "Didn’t get the mail?"),
                                TextSpan(
                                    style: const TextStyle(
                                        color: color_dimmedTeal,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    text: " Resend")
                              ])))),
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
