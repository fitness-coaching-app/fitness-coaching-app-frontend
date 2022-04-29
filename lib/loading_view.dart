import 'package:flutter/material.dart';
import 'package:fitness_coaching_application_test/home/screen/home_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'color.dart';

//New User Setup
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_lightGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Loading
            SpinKitThreeBounce(color: color_dark, size: 30),
          ],
        ),
      ),
    );
  }
}
