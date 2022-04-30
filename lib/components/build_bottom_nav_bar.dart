import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RenderBottomNav.dart';

class BuildBottomNavBar extends StatefulWidget{
  Widget body;

  BuildBottomNavBar({required this.body});

  @override
  State<BuildBottomNavBar> createState() => _BuildBottomNavBarState();
}

class _BuildBottomNavBarState extends State<BuildBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: widget.body,
        bottomNavigationBar: RenderBottomNav(
          page: 'home',
        ));
  }
}