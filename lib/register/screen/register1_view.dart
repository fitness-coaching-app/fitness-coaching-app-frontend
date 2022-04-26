import 'package:fitness_coaching_application_test/buildButton.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/register/screen/register2_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:ionicons/ionicons.dart';
import 'package:http/http.dart' as http;

class Register1 extends StatefulWidget {
  final String displayName;
  final String email;
  const Register1({Key? key, required this.displayName, required this.email})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => Register1State();
}

class Register1State extends State<Register1> {
  Future<void> registerUser(
      String displayName, String email, String password) async {
    var url = Uri.parse(Environment.registerUrl);
    var response = await http.post(url, body: {
      "displayName": displayName,
      "email": email,
      "password": password
    });
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("register failed");
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController pwController = new TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Ionicons.arrow_back,
                      size: 30,
                      color: color_dark,
                    )),
                Container(
                  height: 45,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.4),
                    // child: new SvgPicture.asset(
                    //   'assets/Icon/Cartoon Illustration_lock1.svg',
                    //   height: 100,
                    // ),
                  ),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/Icon/Cartoon Illustration_lock.png"),
                          fit: BoxFit.fill)),
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
                      Text("Pick a Password",
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
                      Text("Password must be at least 8 characters",
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
                      Container(
                        height: 60,
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: color_lightGrey),
                        padding: EdgeInsets.zero,
                      ),
                      Container(
                        height: 15,
                      ),
                      Container(
                        height: 60,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: const TextStyle(
                                color: color_subtitle,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          validator: (String? value) {
                            return (value != null && value != pwController.text)
                                ? 'Password did not match.'
                                : null;
                          },
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: color_lightGrey),
                        padding: EdgeInsets.zero,
                      ),
                      Container(
                        height: 40,
                      ),
                      // create acc Button
                      BuildButton(
                          context: context,
                          name: "Create Account",
                          screenTo: Register2(
                            email: widget.email,
                          ))
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
