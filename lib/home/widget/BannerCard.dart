import 'package:flutter/material.dart';

class BannerCard extends StatefulWidget {
  final String imageUrl;
  final String action;

  BannerCard({Key? key, required this.imageUrl, required this.action})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => BannerCardState();
}

class BannerCardState extends State<BannerCard> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(widget.imageUrl))),
          ),
        ));
  }
}
