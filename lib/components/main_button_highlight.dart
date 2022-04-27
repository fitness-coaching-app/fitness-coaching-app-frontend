import 'package:flutter/material.dart';
import '../color.dart';

class MainButtonHighlight extends StatefulWidget {
  final String text;
  final Function()? onTap;

  MainButtonHighlight({required this.text, required this.onTap});

  @override
  State<StatefulWidget> createState() => _MainButtonHighlightState();
}

class _MainButtonHighlightState extends State<MainButtonHighlight> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new GestureDetector(
          onTap: widget.onTap,
          child: Container(
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.5),
                child: new Text(widget.text,
                    style: const TextStyle(
                        color: color_dark,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: color_teal))),
    );
  }
}
