import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/environment.dart';
import 'package:flutter/material.dart';

class AchievementCard extends StatefulWidget {
  final String header;
  final String description;
  final String imageUrl;
  final bool received;

  AchievementCard({
    Key? key,
    required this.header,
    required this.description,
    required this.imageUrl,
    required this.received,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AchievementCardState();
}

class AchievementCardState extends State<AchievementCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: widget.received ? color_lightGrey : Colors.transparent,
          border: Border.all(
              color: widget.received ? Colors.transparent : color_lightGrey,
              width: 3.0),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: widget.received
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff35aacf),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl == ""
                                  ? Environment.noImageUrl
                                  : widget.imageUrl)))
                      : BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: color_lightGrey, width: 2.0),
                        )),
              Expanded(child: Container()),
              Text(widget.header,
                  style: TextStyle(
                      color: widget.received
                          ? color_dark
                          : Color.fromRGBO(10, 10, 10, 0.4),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.center),
              Expanded(child: Container()),
              Text(widget.description,
                  style: TextStyle(
                      color: widget.received
                          ? color_dark
                          : Color.fromRGBO(10, 10, 10, 0.4),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  textAlign: TextAlign.center),
            ],
          )),
    );
  }
}
