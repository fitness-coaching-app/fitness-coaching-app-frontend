import 'package:flutter/material.dart';
import '../color.dart';

class TouchableText extends StatefulWidget {
  final String text;
  final Function()? onTap;

  TouchableText({required this.text, this.onTap});

  @override
  State<StatefulWidget> createState() => _TouchableTextState();
}

class _TouchableTextState extends State<TouchableText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Text(widget.text,
            style: const TextStyle(
                color: color_dimmedTeal,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.center));
  }
}
