import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RenderBottomNav.dart';

class BuildTopBottomBar extends StatefulWidget{
  Widget body;
  String page;
  PreferredSizeWidget? appBar;

  BuildTopBottomBar({required this.body, required this.page, this.appBar});

  @override
  State<BuildTopBottomBar> createState() => _BuildTopBottomBarState();
}

class _BuildTopBottomBarState extends State<BuildTopBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: widget.body,
        appBar: widget.appBar,
        bottomNavigationBar: RenderBottomNav(
          page: widget.page,
        ));
  }
}