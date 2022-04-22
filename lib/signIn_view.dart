import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/forgotPassword0_view.dart';
import 'package:fitness_coaching_application_test/loading_view.dart';
import 'package:http/http.dart' as http;
import 'register3_view.dart';
import 'userInfo.dart';
import 'color.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  UserInfo? _dataFromAPI;
  TextEditingController emailController = new TextEditingController();
  TextEditingController pwController = new TextEditingController();

  FlutterTts flutterTts = FlutterTts();

  Future<void> getUserInfo(String user) async {
    // var user = "poramee";
    var url = Uri.parse(Environment.getUserInfoUrl + user);
    var response = await http.get(url);
    _dataFromAPI = userInfoFromJson(response.body);
    print(response.body);
  }

  Future<void> logIn(String email, String password) async {
    var url = Uri.parse(Environment.signInUrl);
    var response =
        await http.post(url,
            headers: {"Content-Type": "application/json"},
            body: json.encode({"email": email, "password": password}));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("login failed");
      print(response.body);
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
    Future _speak() async {
      await flutterTts.setLanguage("th - TH");
      await flutterTts.setPitch(1);
      await flutterTts.setSpeechRate(0.6);
      await flutterTts.speak(
          "ยินดีต้อนรับเข้าสู่ Application ออกกำลังกาย\nกรุณาเข้าสู่ระบบค่ะ");
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Padding(
                    padding: EdgeInsets.only(top: 21),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: const Color(0xffc4c4c4))),
                          Container(
                            //color: Colors.red,
                            height: 25,
                          ),
                          GestureDetector(
                              onTap: () => _speak(),
                              child: Text("Sign In",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 26.0),
                                  textAlign: TextAlign.left)),
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
                          // Rectangle 2
                          Container(
                            //width: 325,
                            height: 63,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: const TextStyle(
                                    color: color_subtitle,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(20),
                              ),
                              controller: emailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String? value) =>
                                  validateEmail(value),
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: color_lightGrey),
                            padding: EdgeInsets.zero,
                          ),
                          Container(
                            //color: Colors.red,
                            height: 15,
                          ),
                          // Rectangle 2
                          Container(
                            //width: 325,
                            height: 63,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                    color: color_subtitle,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(20),
                              ),
                              controller: pwController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              validator: (String? value) {
                                return (value!.isEmpty)
                                    ? 'Please enter a password.'
                                    : null;
                              },
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: color_lightGrey),
                            padding: EdgeInsets.zero,
                          ),
                          Container(
                            height: 25,
                          ),
                          // Sign In Button
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: new GestureDetector(
                                      onTap: () {
                                        // logIn("poramee.chansuksett@gmail.com", "poramee");
                                        logIn(emailController.text,
                                            pwController.text);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Loading()),
                                        );
                                      },
                                      child: Container(
                                          height: 60,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.5),
                                            child: new Text("Sign In",
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
                          Container(
                            height: 20,
                          ),
                          Center(
                            child: new GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassword0()),
                                  );
                                },
                                child: Text("Forget Password?",
                                    style: const TextStyle(
                                        color: color_dimmedTeal,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.center)),
                          ),
                          Expanded(child: Container()),
                          // Didn’t have account? Register
                          Center(
                              child: new GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register3()),
                                    );
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
                                        text: "Didn’t have account?"),
                                    TextSpan(
                                        style: const TextStyle(
                                            color: color_dimmedTeal,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        text: " Register")
                                  ])))),
                          Expanded(child: Container()),
                        ])))));
  }
}
