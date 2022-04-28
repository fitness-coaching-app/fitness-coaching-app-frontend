import 'dart:convert';

import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/components/touchable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../api_util.dart';
import '../../environment.dart';
import 'register4_view.dart';

class Register2 extends StatefulWidget {
  final String email;
  final String password;

  const Register2({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => Register2State();
}

class Register2State extends State<Register2> {
  ButtonStatus verifiedButtonStatus = ButtonStatus.active;

  Future<void> resendEmail() async {
    var response = await API
        .post(Environment.resendVerificationEmailUrl, {"email": widget.email});

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {

        });
  }

  Future<void> verificationCheck() async {
    setState(() {
      verifiedButtonStatus = ButtonStatus.loading;
    });
    var response = await API.post(Environment.signInUrl,
        {"email": widget.email, "password": widget.password});
    setState(() {
      verifiedButtonStatus = ButtonStatus.active;
    });
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          var token = Hive.box('token');
          token.put('accessToken', r.results["accessToken"]);
          token.put('refreshToken', r.results["refreshToken"]);
          if (r.results["user"]["status"] != "SETTING_UP") {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Text("Error!"),
                      content: Text(
                          "Sorry, but you haven't verified your email.\nPlease try again later"),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ]);
                });
          }
          else{
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Register4()));
          }
        });
  }

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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Didn’t get the mail?",
                                style: const TextStyle(
                                    color: color_dark,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0)),
                            SizedBox(width: 5),
                            TouchableText(
                                text: "Resend",
                                onTap: () async => await resendEmail())
                          ]),
                      Container(
                        height: 40,
                      ),
                      // verified Button
                      MainButtonHighlight(
                          text: "I'm Verified",
                          status: verifiedButtonStatus,
                          onPressed: verificationCheck)
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
