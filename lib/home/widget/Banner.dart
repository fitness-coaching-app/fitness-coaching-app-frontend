import 'package:flutter/material.dart';

class Banner extends StatefulWidget {


  const Banner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BannerState();
}


class BannerState extends State<Banner> {
  @override
  Widget build(BuildContext context) {
    return Text("Test");
  }

}