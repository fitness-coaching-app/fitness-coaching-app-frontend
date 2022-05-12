import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/components/keyboard_aware.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:fitness_coaching_application_test/components/validators.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/register/screen/register2_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../api_util.dart';

class Register1 extends StatefulWidget {
  final String displayName;
  final String email;

  const Register1({Key? key, required this.displayName, required this.email})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => Register1State();
}

class Register1State extends State<Register1> {
  ButtonStatus status = ButtonStatus.inactive;
  TextEditingController pwController = new TextEditingController();
  GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  GlobalKey<FormState> _confirmPasswordKey = GlobalKey<FormState>();
  bool validPassword = false;
  bool validConfirmPassword = false;

  Future<void> registerUserPressed(
      String displayName, String email, String password) async {
    setState(() {
      status = ButtonStatus.loading;
    });
    var response = await API.post(Environment.registerUrl,
        {"displayName": displayName, "email": email, "password": password});
    setState(() {
      status = ButtonStatus.active;
    });

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Register2(
                      email: widget.email, password: pwController.text)));
        });
  }

  void isValid() {
    setState(() {
      if (validPassword && validConfirmPassword) {
        status = ButtonStatus.active;
      } else if (status != ButtonStatus.loading) {
        status = ButtonStatus.inactive;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyboardAwareView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 21, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FCABackButton(),
                  Container(
                    height: 45,
                  ),
                  SvgPicture.asset(
                    'assets/Icon/icons8-lock.svg',
                    height: 100,
                  ),
                  Container(
                    height: 40,
                  ),
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
                  Form(
                    key: _passwordKey,
                    child: TextBox(
                      hintText: "Password",
                      controller: pwController,
                      validator: passwordValidator,
                      onChanged: (value) {
                        validPassword = _passwordKey.currentState!.validate();
                        isValid();
                      },
                      obscureText: true,
                    ),
                  ),
                  Container(
                    height: 15,
                  ),
                  Form(
                    key: _confirmPasswordKey,
                    child: TextBox(
                      hintText: "Confirm Password",
                      validator: (String? value) {
                        return (value != null && value != pwController.text)
                            ? 'Password did not match.'
                            : null;
                      },
                      onChanged: (value) {
                        validConfirmPassword =
                            _confirmPasswordKey.currentState!.validate();
                        isValid();
                      },
                      obscureText: true,
                    ),
                  ),
                  Container(
                    height: 40,
                  ),
                  // create acc Button
                  MainButtonHighlight(
                      text: "Create Account",
                      status: status,
                      onPressed: () async => await registerUserPressed(
                          widget.displayName, widget.email, pwController.text)),
                ],
              )),
        ),
      ),
    );
  }
}
