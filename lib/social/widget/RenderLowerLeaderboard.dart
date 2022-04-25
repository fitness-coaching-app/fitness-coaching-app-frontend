import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';

class RenderLowerLeaderboard extends StatefulWidget {
  final String rank;
  final String username;
  final String urls;

  RenderLowerLeaderboard({
    Key? key,
    required this.rank,
    required this.username,
    required this.urls,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RenderLowerLeaderboardState();
}

class RenderLowerLeaderboardState extends State<RenderLowerLeaderboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(children: [
            Text(widget.rank,
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.center),
            Container(
                margin: EdgeInsets.fromLTRB(40, 0, 15, 0),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(365),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(widget.urls)))),
            Text(widget.username,
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left)
          ])),
    ]));
  }
}
