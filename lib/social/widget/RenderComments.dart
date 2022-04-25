import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';

class RenderComments extends StatefulWidget {
  final String username;
  final String comments;

  RenderComments({Key? key, required this.username, required this.comments})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => RenderCommentsState();
}

class RenderCommentsState extends State<RenderComments> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.height * 0.04,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(365),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.username != null
                            ? "https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg"
                            : "https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg")))),
            Text(widget.username != null ? widget.username.toString() : "",
                style: const TextStyle(
                    color: color_dark,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left)
          ]),
          Container(
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.height * 0.06, 0, 0, 10),
              child: Text(
                  widget.comments != null ? widget.comments.toString() : "",
                  style: const TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.left))
        ]));
  }
}
