import 'package:flutter/material.dart';

class ActivityPicture extends StatefulWidget {
  final String picture;
  final String header;
  final String detail;

  ActivityPicture({Key? key, required this.picture, required this.header, required this.detail}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ActivityPictureState();
}

class ActivityPictureState extends State<ActivityPicture> {
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
                        Text(widget.header,
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        Text(widget.detail,
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left),
                      ]),
                ]),
              )
          ),
          ),
        );
  }
}
