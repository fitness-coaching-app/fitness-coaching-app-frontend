import 'package:flutter/material.dart';

import 'BannerCard.dart';

class BannerSection extends StatefulWidget {
  final List<BannerCard> banners;

  BannerSection({Key? key, required this.banners}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BannerSectionState();
}

class BannerSectionState extends State<BannerSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        child: RotatedBox(
            quarterTurns: 3,
            child: ListWheelScrollView.useDelegate(
                itemExtent: MediaQuery.of(context).size.width * 0.8,
                diameterRatio: 7,
                childDelegate:
                    ListWheelChildLoopingListDelegate(children: widget.banners))));
  }
}
