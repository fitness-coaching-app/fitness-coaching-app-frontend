import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ReactionsBar extends StatefulWidget {
  final int likeCnt;
  final int commentCnt;
  final String updateToNow;

  ReactionsBar({
    Key? key,
    required this.likeCnt,
    required this.commentCnt,
    required this.updateToNow,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReactionsBarState();
}

class ReactionsBarState extends State<ReactionsBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Row(
              children: [
                Icon(
                  Ionicons.happy_outline,
                  color: color_subtitle,
                  size: 22,
                ),
                Container(
                  width: 5,
                ),
                Text(widget.likeCnt.toString(),
                    style: const TextStyle(
                        color: color_subtitle,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left),
                Container(
                  width: 5,
                ),
                Container(
                  width: 30,
                ),
                Icon(
                  Ionicons.chatbox_outline,
                  color: color_subtitle,
                  size: 22,
                ),
                Container(
                  width: 5,
                ),
                Text(widget.commentCnt.toString(),
                    style: const TextStyle(
                        color: color_subtitle,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left)
              ],
            )),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 20),
                child: Text(widget.updateToNow + " hours ago",
                    style: const TextStyle(
                        color: color_subtitle,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 10.0),
                    textAlign: TextAlign.left)))
      ],
    );
  }
}
