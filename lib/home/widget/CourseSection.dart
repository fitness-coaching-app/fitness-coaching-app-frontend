import 'package:flutter/material.dart';
import '../../color.dart';
import 'CourseCard.dart';

class CourseSection extends StatefulWidget {
  final List<CourseCard> cards;

  CourseSection({
    Key? key,
    required this.cards}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CourseSectionState();

}

class CourseSectionState extends State<CourseSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 20, 20.6, 0),
            child: Text("TITLE",
                style: const TextStyle(
                    color: color_dark,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0),
                textAlign: TextAlign.left)),
        SizedBox(
            height: 10
        ),
        Container(
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.cards
            )
        )
      ],
    );
  }
}