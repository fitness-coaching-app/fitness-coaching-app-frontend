import 'package:flutter/material.dart';
import '../color.dart';

class TextBox extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Icon? suffixIcon;
  final bool readOnly;
  final bool? enable;

  TextBox({this.hintText, this.controller, this.onSaved, this.validator, this.obscureText = false, this.suffixIcon, this.readOnly = false, this.enable});

  @override
  State<StatefulWidget> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: color_subtitle,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins",
          fontStyle: FontStyle.normal,
          fontSize: 16.0,
        ),
        errorStyle: const TextStyle(
          color: color_red
        ),
        filled: true,
        fillColor: color_lightGrey,
        focusColor: color_lightGrey,
        hoverColor: color_lightGrey,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color_teal, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color_red, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color_red, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        contentPadding: EdgeInsets.all(20),
        suffixIcon: widget.suffixIcon
      ),
      style: const TextStyle(
        color: color_dark,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
        fontStyle: FontStyle.normal,
        fontSize: 16.0,
      ),
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      onSaved: widget.onSaved,
      obscureText: widget.obscureText,
      readOnly: widget.readOnly,
      enabled: widget.enable,
    );
  }
}
