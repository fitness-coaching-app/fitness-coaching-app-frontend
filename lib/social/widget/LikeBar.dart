import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LikeBar extends StatefulWidget {
  final List<dynamic>? reactions;

  LikeBar({Key? key, required this.reactions}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LikeBarState();
}

class LikeBarState extends State<LikeBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
            margin: EdgeInsets.fromLTRB(7, 0, 0, 5),
            child: Row(children: [
              Icon(
                Ionicons.happy,
                color: Colors.orangeAccent,
                size: 20,
              ),
              if (widget.reactions != null)
                for (var i = 0; i < widget.reactions!.length; i++)
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(widget.reactions![0][i].toString() + ",",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: color_subtitle,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left)),
              Text(widget.reactions != null ? " and others" : "",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: color_subtitle,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  textAlign: TextAlign.left)
            ])));
  }
}
