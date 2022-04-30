import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

import '../color.dart';
import 'back_button.dart';

class NormalAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final Widget? actionButton;
  final double height;
  final bool backButton;

  NormalAppBar({required this.title, this.subtitle, this.actionButton, this.height = 70, this.backButton = false});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        height: height,
        child: ClipRRect(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...(() {
                        if(backButton) {
                          return [FCABackButton(),SizedBox(width: 20)];
                        }
                        return [];
                      }()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(title,
                              style: const TextStyle(
                                  color: color_dark,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26.0),
                              textAlign: TextAlign.left),
                          if(subtitle != null)
                            Text(subtitle!,
                                style: const TextStyle(
                                    color: color_subtitle,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),

                        ]
                      ),
                      Expanded(child: Container()),
                      if(actionButton != null) actionButton!
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
