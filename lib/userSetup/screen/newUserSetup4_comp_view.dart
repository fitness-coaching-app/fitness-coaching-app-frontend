import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/main_button_highlight.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/loading_view.dart';
import 'package:hive/hive.dart';

import '../../api_util.dart';
import '../../environment.dart';

//New User Setup
class NewUserSetupComp extends StatefulWidget {
  const NewUserSetupComp({Key? key}) : super(key: key);

  @override
  State<NewUserSetupComp> createState() => _NewUserSetupCompState();
}

class _NewUserSetupCompState extends State<NewUserSetupComp> {
  ButtonStatus status = ButtonStatus.active;

  Future<void> fetchUserInfo() async {
    setState(() {
      status = ButtonStatus.loading;
    });
    var response = await API.get(Environment.getUserInfoUrl, withToken: true);
    var isSuccess = false;
    API.responseAlertWhenError(
        context: context,
        response: response,
        whenSuccess: (r) {
          var user = Hive.box('user');
          user.put('data', r.results!);
          isSuccess = true;
        });
    setState(() {
      status = ButtonStatus.active;
    });
    if(isSuccess){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Home()),
              (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Container()),
              Center(
                  child: Text(
                'You’re\nall set',
                style: Theme.of(context).textTheme.headline1,
              )),
              Expanded(child: Container()),
              Center(
                  child: Container(
                      height: 56,
                      child: Text("You can now use the app",
                          style: const TextStyle(
                              color: color_lightGrey,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign
                              .center)) // We’ll ask you some questions to personalize your experience.
                  ),
              Container(
                //color: Colors.red,
                height: 10,
              ),
              MainButtonHighlight(
                  text: "Let's Go", status: status, onPressed: fetchUserInfo),
              Container(
                //color: Colors.red,
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
