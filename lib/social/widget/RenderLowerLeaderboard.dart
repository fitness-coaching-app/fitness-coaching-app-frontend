import 'package:flutter/material.dart';

import '../../environment.dart';

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
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: 40,
            child: Text(widget.rank,
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left),
          ),
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.urls == ""
                          ? Environment.noImageUrl
                          : widget.urls)))),
          SizedBox(width: 20),
          Text(widget.username,
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left)
        ]));
  }
}
