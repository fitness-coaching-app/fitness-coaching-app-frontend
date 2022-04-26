import 'package:fitness_coaching_application_test/buildButton.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'register4_view.dart';

class Register2 extends StatefulWidget {
  final String email;
  const Register2({Key? key, required this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Register2State();
}

class Register2State extends State<Register2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    child: SvgPicture.asset(
                      'assets/Icon/Cartoon Illustration_email1.svg',
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
                          "Account verification link has been sent to your email address:\n" +
                              widget.email,
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
                      // Didn’t get the mail?
                      Center(
                          child: new GestureDetector(
                              onTap: () {
                                print('Tap Didn’t get the mail');
                              },
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
                      Container(
                        height: 40,
                      ),
                      // verified Button
                      BuildButton(
                          context: context,
                          name: "I’m Verified",
                          screenTo: Register4())
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
