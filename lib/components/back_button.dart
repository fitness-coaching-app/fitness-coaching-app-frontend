import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:fitness_coaching_application_test/color.dart';

class FCABackButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FCABackButtonState();
}

class _FCABackButtonState extends State<FCABackButton> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Ionicons.arrow_back,
          size: 30,
          color: color_dark,
        ));
  }
}
