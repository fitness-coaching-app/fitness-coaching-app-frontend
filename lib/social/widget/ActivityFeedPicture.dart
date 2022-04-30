import 'package:fitness_coaching_application_test/color.dart';
import 'package:fitness_coaching_application_test/social/screen/social_activity_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ActivityFeedPicture extends StatefulWidget {
  final String actHeader;
  final String actDetail;

  final List<dynamic> reactions;
  final List<dynamic> comments;
  final String picture;
  final String updateOn;

  ActivityFeedPicture({
    Key? key,
    required this.actHeader,
    required this.actDetail,
    required this.reactions,
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
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.centerRight,
                      image: NetworkImage(widget.picture),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.actHeader,
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        Text(widget.actDetail,
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left),
                      ]),
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
                          )))
                ]),
              )),
        ));
  }
}
