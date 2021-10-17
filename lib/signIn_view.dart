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
                              
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: const Color(0xffc4c4c4))),
                          Container(
                            //color: Colors.red,
                            height: 25,
                          ),
                          // Let’s sign you in
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
                            )),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: color_lightGrey),
                            padding: EdgeInsets.zero,
                          ),
                          Container(
                            height: 25,
                          ),
                          // Rectangle 1
                          Container(
                              width: 325,
                              height: 60,
                              // TEXT
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.5),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: color_teal)),
                          Container(
                            height: 20,
                          ),
                          Center(
                            child: Text("Forget Password?",
                                style: const TextStyle(
                                    color: color_dimmedTeal,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.center),
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
                          Expanded(child: Container()),
                        ])))));
  }
}
