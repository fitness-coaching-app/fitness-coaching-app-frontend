import 'package:flutter/material.dart';
import 'color.dart';
//New User Setup
class NewUserSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: Container()),
            Center(
                child: Text(
              'Welcome to',
              style: Theme.of(context).textTheme.headline1,
            )),
            Center(
                child: Text(
              'FIT+',
              style: Theme.of(context).textTheme.headline1,
            )),
            Expanded(child: Container()),
            Center(
              child: Text(
                'We’ll ask you some questions to',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Center(
              child: Text(
                'personalize your experience.',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Container(
              //color: Colors.red,
              height: 10,
            ),
            Center(
                child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: Text(
                'Get started',
                style: Theme.of(context).textTheme.button,
              ),
            )),
            Container(
              //color: Colors.red,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}