import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';

class TimeBar extends StatefulWidget {
  final DateTime time;

  TimeBar({Key? key, required this.time}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TimeBarState();
}

class TimeBarState extends State<TimeBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 15),
            child: Text(
                widget.time.hour.toString() +
                    ":" +
                    widget.time.minute.toString() +
                    "   •   " +
                    widget.time.day.toString() +
                    "/" +
                    widget.time.month.toString() +
                    "/" +
                    widget.time.year.toString(),
                style: const TextStyle(
                    color: color_subtitle,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                textAlign: TextAlign.left)));
  }
}
