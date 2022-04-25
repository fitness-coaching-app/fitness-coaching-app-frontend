import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class StatsCard extends StatefulWidget {
  final String height;
  final String weight;
  final String bmi;
  final bool isPrivate;

  StatsCard({
    Key? key,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.isPrivate,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => StatsCardState();
}

class StatsCardState extends State<StatsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.16,
        decoration: BoxDecoration(
            color: Color(0xFFefefef), borderRadius: BorderRadius.circular(15)),
        child: Padding(
            padding: EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text("Stats",
                    style: const TextStyle(
                        color: color_dark,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left),
                Expanded(child: Container()),
                Icon(
                  Ionicons.lock_closed,
                  size: 13,
                  color: color_subtitle,
                ),
                Container(
                  width: 10,
                ),
                Text(widget.isPrivate == true ? "Private" : "Public",
                    style: const TextStyle(
                        color: color_subtitle,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left),
                Container(
                  width: 10,
                ),
                Icon(
                  Ionicons.chevron_forward,
                  size: 18,
                  color: color_subtitle,
                ),
              ]),
              Container(
                height: 14,
              ),

              //height weight bmi
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(child: Container()),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Height",
                      style: const TextStyle(
                          color: color_purple,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                      textAlign: TextAlign.left),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0),
                        text: widget.height),
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0),
                        text: " "),
                    TextSpan(
                        style: const TextStyle(
                            color: color_subtitle,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        text: "cm")
                  ]))
                ]),
                Expanded(child: Container()),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Weight",
                      style: const TextStyle(
                          color: const Color(0xff00829e),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                      textAlign: TextAlign.left),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0),
                        text: widget.weight),
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0),
                        text: " "),
                    TextSpan(
                        style: const TextStyle(
                            color: color_subtitle,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        text: "kg")
                  ]))
                ]),
                Expanded(child: Container()),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("BMI",
                      style: const TextStyle(
                          color: const Color(0xff00a682),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                      textAlign: TextAlign.left),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0),
                        text: widget.bmi),
                  ]))
                ]),
                Expanded(child: Container()),
              ])
            ])));
  }
}
