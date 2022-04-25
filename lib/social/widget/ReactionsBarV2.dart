import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ReactionsBarV2 extends StatefulWidget {
  ReactionsBarV2({
    Key? key,
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
                  Ionicons.chatbox_outline,
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
        Container(
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: "Write a comment...",
                hintStyle: const TextStyle(
                    color: color_subtitle,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
                suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Ionicons.send,
                      size: 25,
                      color: color_dark,
                    ))),
            controller: commentController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // validator: (String? value) => validateEmail(value),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: color_lightGrey,
          ),
          padding: EdgeInsets.zero,
          margin: EdgeInsets.only(bottom: 20),
        )
      ],
    );
  }
}
