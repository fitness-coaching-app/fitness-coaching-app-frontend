import 'package:flutter/material.dart';

import '../../color.dart';
import '../../components/CourseCard.dart';

class CourseSection extends StatefulWidget {
  final String title;
  final List<CourseCard> cards;

  CourseSection({Key? key,required this.title, required this.cards}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CourseSectionState();
}

class CourseSectionState extends State<CourseSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 25),
            Text(widget.title,
                style: const TextStyle(
                    color: color_dark,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0),
                textAlign: TextAlign.left)
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 25),
              scrollDirection: Axis.horizontal,
              children: widget.cards),
        )
      ],
    );
  }
}
