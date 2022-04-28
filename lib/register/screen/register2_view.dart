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
  Future<Map<String, dynamic>?> resendEmail() async {
    var response = await API
        .post(Environment.resendVerificationEmailUrl, {"email": widget.email});
    if (response != null) {
      var body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {"error": false};
      } else {
        return {"error": true, "body": body};
      }
    }
  }

  Future<Map<String, dynamic>?> verificationCheck() async {
    setState(() {
      verifiedButtonStatus = ButtonStatus.loading;
    });
    var response = await API.post(Environment.signInUrl,
        {"email": widget.email, "password": widget.password});
    var token = Hive.box('token');
    setState(() {
      verifiedButtonStatus = ButtonStatus.active;
    });
    if (response != null) {
      var body = jsonDecode(response.body);
      token.put('accessToken', body["results"]["accessToken"]);
      token.put('refreshToken', body["results"]["refreshToken"]);
      if (response.statusCode == 200) {
        if (body["results"]["user"]["status"] == "SETTING_UP") {
          print("PASS");
          return {"error": false};
        } else {
          print("FAIL");
          return {"error": true, "body": body};
        }
      } else {
        return {"error": true, "body": body};
      }
    }
  }

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
                                onTap: () {
                                  resendEmail().then((value) {
                                    if (value != null) {
                                      print(value);
                                    }
                                  });
                                })
                          ]),
                      Container(
                        height: 40,
                      ),
                      // verified Button
                      MainButtonHighlight(
                          text: "I'm Verified",
                          status: verifiedButtonStatus,
                          onPressed: () {
                            verificationCheck().then((value) {
                              if (value != null) {
                                if (!value["error"]) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register4()),
                                  );
                                }
                              }
                            });
                          })
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
