import 'package:fitness_coaching_application_test/userProfile/screen/user_people_view.dart';
import 'package:flutter/material.dart';

class UsernameBar extends StatefulWidget {
  final String imageUrl;
  final String username;
  final String userId;

  UsernameBar(
      {Key? key,
      required this.imageUrl,
      required this.username,
      required this.userId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => UsernameBarState();
}

class UsernameBarState extends State<UsernameBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserPeopleView(userId: widget.userId)));
      },
      child: Row(children: [
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
      ]),
    );
  }
}
