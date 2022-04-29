import 'package:flutter/material.dart';
import '../color.dart';
import 'text_box.dart';

class TouchableTextBox extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Icon suffixIcon;
  final void Function() onTap;

  TouchableTextBox({this.hintText, this.controller, required this.suffixIcon, required this.onTap});

  @override
  State<StatefulWidget> createState() => _TouchableTextBoxState();
}

class _TouchableTextBoxState extends State<TouchableTextBox> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: widget.onTap,
      child: TextBox(
        hintText: widget.hintText,
        controller: widget.controller,
        suffixIcon: widget.suffixIcon,
        readOnly: true,
        enable: false
      )
    );
  }
}
