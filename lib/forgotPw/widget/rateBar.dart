import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RateBar extends StatefulWidget {
  RateBar({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RateBarState();
}

class RateBarState extends State<RateBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Rate this Course",
            style: const TextStyle(
                color: color_dark,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 20.0),
            textAlign: TextAlign.left),
        Container(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              child: Icon(
            Ionicons.star_outline,
            size: 28.1,
          )),
          Container(
            width: 16.9,
          ),
          Container(
              child: Icon(
            Ionicons.star_outline,
            size: 28.1,
          )),
          Container(
            width: 16.9,
          ),
          Container(
              child: Icon(
            Ionicons.star_outline,
            size: 28.1,
          )),
          Container(
            width: 16.9,
          ),
          Container(
              child: Icon(
            Ionicons.star_outline,
            size: 28.1,
          )),
          Container(
            width: 16.9,
          ),
          Container(
              child: Icon(
            Ionicons.star_outline,
            size: 28.1,
          )),
        ]),
      ],
    );
  }
}
