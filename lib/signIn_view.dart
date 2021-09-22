import 'package:flutter/material.dart';
import 'color.dart';
class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Padding(
                    padding: EdgeInsets.only(top: 21),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: 132,
                              height: 133,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: const Color(0xffc4c4c4))),
                          Container(
                            //color: Colors.red,
                            height: 56,
                          ),
                          // Let’s sign you in
                          Text("Let’s sign you in",
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 28.0),
                              textAlign: TextAlign.left),
                          Container(
                            //color: Colors.red,
                            height: 6,
                          ), // Welcome back !
                          Text("Welcome back !",
                              style: const TextStyle(
                                  color: const Color(0xb210334b),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 22.0),
                              textAlign: TextAlign.left),
                          Container(
                            //color: Colors.red,
                            height: 51,
                          ),
                          // Rectangle 2
                          Container(
                            width: 325,
                            height: 63,
                            child: TextFormField(
                                decoration: InputDecoration(
                              hintText: "Username or Email",
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
                            width: 325,
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
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: color_lightGrey),
                            padding: EdgeInsets.zero,
                          ),
                          Expanded(child: Container()),
                          // Didn’t have account? Register
                          Center(
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
                          ]))),
                          Container(
                            //color: Colors.red,
                            height: 13,
                          ),
                          // Rectangle 1
                          Container(
                              width: 325,
                              height: 66,
                              // TEXT
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.5),
                                child: new Text(
                                  "Sign in",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 22.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(33)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0x4d000000),
                                        offset: Offset(0, 0),
                                        blurRadius: 7,
                                        spreadRadius: 0)
                                  ],
                                  color: color_teal)),
                          Container(
                            height: 44,
                          ),
                        ])))));}}