import 'package:flutter/material.dart';
import 'color.dart';
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
                                        child: new Text("I’m Verified",
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
