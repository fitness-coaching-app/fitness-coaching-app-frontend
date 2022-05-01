import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';

class RenderComments extends StatefulWidget {
  final String username;
  final String comments;
  final String profilePicture;

  RenderComments(
      {Key? key,
      required this.username,
      required this.comments,
      required this.profilePicture})
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
          Row(
            children: [
              Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(365),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.profilePicture != ""
                              ? widget.profilePicture
                              : "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png")))),
              SizedBox(width: 10),
              Text(widget.username,
                  style: const TextStyle(
                      color: color_dark,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.left),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
            child: Text(widget.comments,
                style: const TextStyle(
                    color: color_dark,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left),
          ),
          SizedBox(height: 10)
        ]));
  }
}
