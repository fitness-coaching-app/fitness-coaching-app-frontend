import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/components/keyboard_aware.dart';
import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:fitness_coaching_application_test/register/screen/register1_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register0 extends StatefulWidget {
  final String displayName;

  const Register0({Key? key, required this.displayName}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Register0State();
}

class Register0State extends State<Register0> {
  TextEditingController emailController = new TextEditingController();

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
        child: KeyboardAwareView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FCABackButton(),
                  Container(
                    height: 45,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.4),
                      child: new SvgPicture.asset(
                        'assets/Icon/Cartoon Illustration_at1.svg',
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
                        Text("Enter Your Email",
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
                        Text("Please enter your email",
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
                        TextBox(
                          hintText: "Enter your email",
                          controller: emailController,
                          validator: (String? value) => validateEmail(value),
                        ),
                        Container(
                          height: 40,
                        ),
                        // Send Instructions Button
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: new GestureDetector(
                                    onTap: () {
                                      //emailController.text
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register1(
                                                  displayName: widget.displayName,
                                                  email: emailController.text,
                                                )),
                                      );
                                    },
                                    child: Container(
                                        height: 60,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16.5),
                                          child: new Text("Next",
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
      ),
    );
  }
}
