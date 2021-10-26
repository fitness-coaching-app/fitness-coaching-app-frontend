import 'package:flutter/material.dart';
import 'package:flutter_application_2/register2_view.dart';
import 'package:ionicons/ionicons.dart';
import 'color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.6, 21, 20.6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: InkWell(
                    splashColor: color_dark.withAlpha(50),
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: Ink(
                      width: 290,
                      height: 190,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                    width: 290,
                    height: 190,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: color_alertPurple))
              ],
            )),
      ),
    );
  }
}
