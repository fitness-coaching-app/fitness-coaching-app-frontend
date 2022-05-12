import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/components/keyboard_aware.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:fitness_coaching_application_test/components/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'register0_view.dart';

class Register3 extends StatefulWidget {
  const Register3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Register3State();
}

class Register3State extends State<Register3> {
  TextEditingController displayNameController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ButtonStatus displayNameStatus = ButtonStatus.inactive;

  void isValid() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        displayNameStatus = ButtonStatus.active;
      } else {
        displayNameStatus = ButtonStatus.inactive;
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
                        'assets/Icon/Cartoon Illustration_man1.svg',
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
                            Text("Pick Your Display Name",
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
                            Text("Pick a display name for your account",
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
                              hintText: "Enter your display name",
                              controller: displayNameController,
                              validator: displayNameValidator,
                              onChanged: (value) {
                                isValid();
                              }),
                        ),

                        Container(
                          height: 40,
                        ),
                        // Send Instructions Button
                        MainButtonHighlight(
                            text: "Next",
                            status: displayNameStatus,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register0(
                                          displayName:
                                              displayNameController.text,
                                        )),
                              );
                            }),
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
