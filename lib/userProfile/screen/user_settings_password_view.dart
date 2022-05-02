import 'package:fitness_coaching_application_test/components/button_status.dart';
import 'package:fitness_coaching_application_test/components/keyboard_aware.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/components/normal_app_bar.dart';
import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:fitness_coaching_application_test/components/validators.dart';
import 'package:flutter/material.dart';

import '../../api_util.dart';
import '../../environment.dart';

class UserSettingsPassword extends StatefulWidget {
  const UserSettingsPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserSettingsPasswordState();
}

class UserSettingsPasswordState extends State<UserSettingsPassword> {
  TextEditingController currentPwController = new TextEditingController();
  TextEditingController newPwController = new TextEditingController();
  TextEditingController confirmPwController = new TextEditingController();

  ButtonStatus status = ButtonStatus.active;

  Future<void> setNewPassword() async {
    setState(() {
      status = ButtonStatus.loading;
    });
    var response = await API.post(
        Environment.setNewPasswordUrl,
        {
          "oldPassword": currentPwController.text,
          "newPassword": newPwController.text,
          "confirmNewPassword": confirmPwController.text,
        },
        withToken: true);
    setState(() {
      status = ButtonStatus.active;
    });

    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          Navigator.of(context).pop();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppBar(
          title: "Change Password",
          backButton: true,
        ),
        body: SafeArea(
          child: KeyboardAwareView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBox(
                    hintText: "Current Password",
                    controller: currentPwController,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  TextBox(
                    hintText: "New Password",
                    controller: newPwController,
                    validator: (String? value) => passwordValidator(value),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  TextBox(
                    hintText: "Confirm New Password",
                    controller: confirmPwController,
                    validator: (String? value) => passwordValidator(value),
                    obscureText: true,
                  ),
                  Container(
                    height: 60,
                  ),
                  MainButtonHighlight(
                      text: 'Done',
                      status: status,
                      onPressed: () async {
                        await setNewPassword();
                      }),
                  //bottom section
                  Container(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
