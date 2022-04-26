import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';

class RenderSummaryBar extends StatefulWidget {
  final String xp;
  final String time;
  final String calories;

  RenderSummaryBar({
    Key? key,
    required this.xp,
    required this.time,
    required this.calories,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RenderSummaryBarState();
}

class RenderSummaryBarState extends State<RenderSummaryBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("XP Earned",
                  style: const TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                  textAlign: TextAlign.left),
              Expanded(child: Container()),
              Text(widget.xp,
                  style: const TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 32.0),
                  textAlign: TextAlign.right),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Time",
                  style: const TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                  textAlign: TextAlign.left),
              Expanded(child: Container()),
              Text(widget.time,
                  style: const TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 32.0),
                  textAlign: TextAlign.right),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Calories",
                  style: const TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                  textAlign: TextAlign.left),
              Expanded(child: Container()),
              Text(widget.calories,
                  style: const TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 32.0),
                  textAlign: TextAlign.right),
            ])
      ],
    );
  }
}
