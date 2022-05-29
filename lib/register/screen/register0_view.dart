import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/components/keyboard_aware.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:fitness_coaching_application_test/components/validators.dart';
import 'package:fitness_coaching_application_test/register/screen/register1_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register0 extends StatefulWidget {
  final String displayName;

  const Register0({Key? key, required this.displayName}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Register0State();
}

class Register0State extends State<Register0> {
  TextEditingController emailController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ButtonStatus nextButtonStatus = ButtonStatus.inactive;

  void isValid(String value) {
    setState(() {
      if (_formKey.currentState!.validate()) {
        nextButtonStatus = ButtonStatus.active;
      } else {
        nextButtonStatus = ButtonStatus.inactive;
      }
    });
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
                        Form(
                          key: _formKey,
                          child: TextBox(
                            hintText: "Enter your email",
                            controller: emailController,
                            validator: emailValidator,
                            onChanged: isValid,
                          ),
                        ),
                        Container(
                          height: 40,
                        ),
                        MainButtonHighlight(
                            text: "Next",
                            status: nextButtonStatus,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register1(
                                          displayName: widget.displayName,
                                          email: emailController.text,
                                        )),
                              );
                            })
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
