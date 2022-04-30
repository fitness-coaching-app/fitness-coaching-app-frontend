import 'package:flutter/material.dart';

class UsernameBar extends StatefulWidget {
  final String imageUrl;
  final String username;

  UsernameBar({Key? key, required this.imageUrl, required this.username})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => UsernameBarState();
}

class UsernameBarState extends State<UsernameBar> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.imageUrl)))),
      Text(widget.username,
          style: const TextStyle(
              color: const Color(0xff000000),
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          textAlign: TextAlign.left)
    ]);
  }
}
