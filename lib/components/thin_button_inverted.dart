import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../color.dart';
import 'button_status.dart';

export 'button_status.dart';

class ThinButtonInverted extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  final ButtonStatus status;

  ThinButtonInverted(
      {required this.text,
      required this.onPressed,
      this.status = ButtonStatus.active});

  @override
  State<StatefulWidget> createState() => _ThinButtonInvertedState();
}

class _ThinButtonInvertedState extends State<ThinButtonInverted> {
  @override
  Widget build(BuildContext context) {
    Widget buttonChild = new Text(widget.text,
        style: const TextStyle(
            color: color_dark,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
            fontSize: 18.0),
        textAlign: TextAlign.center);
    if (widget.status == ButtonStatus.loading) {
      buttonChild = SpinKitThreeBounce(color: color_dark, size: 16.0);
    }
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: widget.status == ButtonStatus.active
                ? Colors.transparent
                : Color.fromRGBO(101, 122, 136, 1.0),
            minimumSize: Size.fromHeight(40),
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: color_teal, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
        onPressed:
            widget.status == ButtonStatus.active ? widget.onPressed : null,
        child: buttonChild);
  }
}
