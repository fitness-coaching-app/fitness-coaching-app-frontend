import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_profile_follower_view.dart';
import 'package:fitness_coaching_application_test/userProfile/screen/user_profile_following_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class TwoToggleIcons extends StatefulWidget {
  final IconData options1;
  final IconData options2;
  final StatefulWidget screenTo;
  final bool isSelectOptn1;

  TwoToggleIcons({
    Key? key,
    required this.options1,
    required this.options2,
    required this.screenTo,
    required this.isSelectOptn1,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TwoToggleIconsState();
}

class TwoToggleIconsState extends State<TwoToggleIcons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Color(0xFFefefef), borderRadius: BorderRadius.circular(40)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          height: 40,
          width: (MediaQuery.of(context).size.width / 2) - 25,
          decoration: widget.isSelectOptn1 == true
              ? BoxDecoration(
                  color: Color(0xFFC0FFD9),
                  borderRadius: BorderRadius.circular(40))
              : null,
          child: GestureDetector(
              onTap: () {
                if (widget.isSelectOptn1 != true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widget.screenTo),
                  );
                }
              },
              child: Icon(
                widget.options1,
                color: widget.isSelectOptn1 == false
                    ? Color(0xffc9c9c9)
                    : Color(0xFF00A682),
              )),
        ),
        Expanded(child: Container()),
        Container(
            height: 40,
            width: (MediaQuery.of(context).size.width / 2) - 25,
            decoration: widget.isSelectOptn1 == false
                ? BoxDecoration(
                    color: Color(0xFFC0FFD9),
                    borderRadius: BorderRadius.circular(40))
                : null,
            child: GestureDetector(
                onTap: () {
                  if (widget.isSelectOptn1 == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => widget.screenTo),
                    );
                  }
                },
                child: Icon(
                  widget.options2,
                  color: widget.isSelectOptn1 == true
                      ? Color(0xffc9c9c9)
                      : Color(0xFF00A682),
                ))),
        Expanded(child: Container()),
      ]),
    );
  }
}
