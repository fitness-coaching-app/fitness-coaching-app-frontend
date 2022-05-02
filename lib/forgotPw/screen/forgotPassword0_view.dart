import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/back_button.dart';
import 'package:fitness_coaching_application_test/components/keyboard_aware.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:fitness_coaching_application_test/components/validators.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:fitness_coaching_application_test/forgotPw/screen/forgotPassword1_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../api_util.dart';

class ForgotPassword0 extends StatefulWidget {
  const ForgotPassword0({Key? key}) : super(key: key);

  @override
  State<ForgotPassword0> createState() => _ForgotPassword0State();
}

class _ForgotPassword0State extends State<ForgotPassword0> {
  bool loading = false;

  Future<void> forgotPasswordPressed(
      String email) async {
    setState(() {
      loading = true;
    });
    var response =
        await API.post(Environment.forgetPasswordUrl, {"email": email});
    setState(() {
      loading = false;
    });

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ForgotPassword1()),
          );
        });
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
    TextEditingController emailController = new TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: KeyboardAwareView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 21, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FCABackButton(),
                  SizedBox(
                    height: 45,
                  ),
                  new SvgPicture.asset(
                    'assets/Icon/Cartoon Illustration1.svg',
                    height: 100,
                  ),
                  Container(
                    height: 40,
                  ),
                  Text("Forget Password?",
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
                      "Enter the email associated with your account and we’ll send an email with instructions to reset your password.",
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
                    validator: (String? value) => emailValidator(value),
                  ),
                  Container(
                    height: 40,
                  ),
                  MainButtonHighlight(
                      text: "Send Instruction",
                      status:
                          loading ? ButtonStatus.loading : ButtonStatus.active,
                      onPressed: () async =>
                          await forgotPasswordPressed(emailController.text)),
                ],
              )),
        ),
      ),
    );
  }
}
