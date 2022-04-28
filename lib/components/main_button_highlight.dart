import 'package:flutter/material.dart';
import '../color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


enum ButtonStatus {
  inactive,
  active,
  loading
}

class MainButtonHighlight extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  final ButtonStatus status;

  MainButtonHighlight(
      {required this.text, required this.onPressed, this.status = ButtonStatus
          .active});

  @override
  State<StatefulWidget> createState() => _MainButtonHighlightState();
}

class _MainButtonHighlightState extends State<MainButtonHighlight> {
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
      buttonChild = SpinKitThreeBounce(
          color: color_dark,
          size: 16.0
      );
    }
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: widget.status == ButtonStatus.active ? color_teal : Color
                .fromRGBO(101, 122, 136, 1.0),
            minimumSize: Size.fromHeight(60),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
        onPressed: widget.status == ButtonStatus.active? widget.onPressed: null,
        child: buttonChild);
  }
}
