import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/social/screen/social_activity_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ActivityFeedPicture extends StatefulWidget {
  final String actHeader;
  final String actDetail;
  final String username;

  final String urls;
  final List<List<String>> likes;
  final List<List<String>> comments;
  final String picture;
  final String updateOn;

  ActivityFeedPicture({
    Key? key,
    required this.actHeader,
    required this.actDetail,
    required this.username,
    required this.urls,
    required this.likes,
    required this.comments,
    required this.picture,
    required this.updateOn,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ActivityFeedPictureState();
}

class ActivityFeedPictureState extends State<ActivityFeedPicture> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActivityDetail(
                            username: widget.username,
                            urls: widget.urls,
                            picture: widget.picture,
                            comments: widget.comments.length > 0
                                ? widget.comments
                                : null,
                            likesUsername:
                                widget.likes.length > 0 ? widget.likes : null,
                            time: DateTime.parse(widget.updateOn),
                          )));
            },
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                margin: EdgeInsets.only(bottom: 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.picture),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Container()),
                          Text(widget.actHeader,
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left),
                          Row(children: [
                            Text(widget.actDetail,
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left),
                            Expanded(child: Container()),
                            Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Color(0xccee9715),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Ionicons.dice,
                                    color: color_white,
                                    size: 18,
                                  ),

                                  //change icon to difficulty icon (dot icon)
                                  // child: Image(
                                  //   image: NetworkImage(
                                  //       picture[i]),
                                  // ),
                                ))
                          ])
                        ])))));
  }
}