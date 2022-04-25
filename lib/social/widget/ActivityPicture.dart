import 'package:flutter/material.dart';

class ActivityPicture extends StatefulWidget {
  final String picture;

  ActivityPicture({Key? key, required this.picture}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ActivityPictureState();
}

class ActivityPictureState extends State<ActivityPicture> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
            onTap: () {},
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              margin: EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.picture),
                      // colorFilter: ColorFilter.mode(
                      //     Colors.black.withOpacity(0.5),
                      //     BlendMode.darken),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10)),
            )));
  }
}
