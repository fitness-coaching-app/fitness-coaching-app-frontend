import 'dart:convert';

import 'package:fitness_coaching_application_test/forgotPw/screen/forgotPassword0_view.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:fitness_coaching_application_test/register/screen/register3_view.dart';
import 'package:fitness_coaching_application_test/userProfile/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/loading_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'api_util.dart';
import 'color.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'components/main_button_highlight.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:fitness_coaching_application_test/components/keyboard_aware.dart';

import 'components/touchable_text.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController pwController = new TextEditingController();

  FlutterTts flutterTts = FlutterTts();

  Future<Map<String, dynamic>?> logIn(String email, String password) async {
    var response = await API
        .post(Environment.signInUrl, {"email": email, "password": password});
    if (response != null) {
      Map<String, dynamic> body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(body);
        var token = Hive.box('token');
        var user = Hive.box('user');
        token.put('accessToken', body["results"]["accessToken"]);
        token.put('refreshToken', body["results"]["refreshToken"]);
        user.put('data', body["results"]["user"]);
      } else {
        print("Login Failed");
        print(response.body);
      }
      return body;
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Please enter a valid email address';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: KeyboardAwareView(
            child: Column(
              children: <Widget>[
                  Flexible(
                    flex: 223,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/Icon/Cartoon Illustration_wavinghand.svg',
                          height: 100,
                        ),
                        SizedBox(height: 25),
                        Text("Sign In",
                            style: const TextStyle(
                                color: color_dark,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 26.0),
                            textAlign: TextAlign.left),
                        Container(
                          //color: Colors.red,
                          height: 5,
                        ), // Welcome back !
                        Text("Welcome back !",
                            style: const TextStyle(
                                color: const Color(0xb210334b),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        Container(
                          //color: Colors.red,
                          height: 25,
                        ),
                        TextBox(
                          hintText: "Email",
                          controller: emailController,
                          validator: (String? value) => validateEmail(value),
                        ),
                        Container(
                          //color: Colors.red,
                          height: 15,
                        ),
                        TextBox(
                            hintText: "Password",
                            controller: pwController,
                            validator: (String? value) {
                              return (value!.isEmpty)
                                  ? 'Please enter a password.'
                                  : null;
                            },
                            obscureText: true),
                        Container(
                          height: 25,
                        ),
                        // Sign In Button
                        MainButtonHighlight(
                            text: "Sign In",
                            onPressed: () async {
                              logIn(emailController.text, pwController.text)
                                  .then((value) {
                                print(value);
                                if (value != null && value["code"] == 200) {
                                  print("OK");
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                }
                              });
                            }),
                        Container(
                          height: 20,
                        ),
                        Center(
                            child: TouchableText(
                                text: "Forget Password?",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPassword0()),
                                  );
                                })),
                      ],
                    ),
                ),

                // Didn’t have account? Register
                Flexible(
                  flex: 33,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Didn’t have account?",
                        style: const TextStyle(
                            color: color_dark,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0)),
                    SizedBox(width: 5),
                    TouchableText(
                        text: "Register",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register3()),
                          );
                        })
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
