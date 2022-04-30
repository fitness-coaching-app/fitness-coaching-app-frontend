import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/components/text_box.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ReactionsBarV2 extends StatefulWidget {
  final String activityId;
  ReactionsBarV2({
    Key? key,
    required this.activityId
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReactionsBarV2State();
}

class ReactionsBarV2State extends State<ReactionsBarV2> {
  TextEditingController commentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(5, 10, 0, 20),
            child: Row(
              children: [
                Icon(
                  Ionicons.happy_outline,
                  color: color_subtitle,
                  size: 25,
                ),
                Container(
                  width: 10,
                ),
                Text("React",
                    style: const TextStyle(
                        color: color_subtitle,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
                Container(
                  width: 35,
                ),
                Icon(
                  Ionicons.chatbubble_outline,
                  color: color_subtitle,
                  size: 25,
                ),
                Container(
                  width: 10,
                ),
                Text("Comment",
                    style: const TextStyle(
                        color: color_subtitle,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left)
              ],
            )),

        //comment tab
        TextBox(
          hintText: "Write a comment...",
          controller: commentController,
          suffixIcon: GestureDetector(
              onTap: () {},
              child: Icon(
                Ionicons.send,
                size: 25,
                color: color_dark,
              )),
        ),
      ],
    );
  }
}
