import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../color.dart';

import '../../components/button_status.dart';
import '../../components/button_status.dart';

class LetsGoButton extends StatefulWidget {
  final ButtonStatus status;
  final void Function()? onPressed;

  LetsGoButton({this.status = ButtonStatus.active, this.onPressed});

  @override
  State<LetsGoButton> createState() => _LetsGoButtonState();
}

class _LetsGoButtonState extends State<LetsGoButton> {
  @override
  Widget build(BuildContext context) {
    Widget buttonChild = new Text("Let's Go",
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
            fontSize: 18.0),
        textAlign: TextAlign.center);
    if (widget.status == ButtonStatus.loading) {
      buttonChild = SpinKitThreeBounce(color: color_dark, size: 16.0);
    }
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(17, 71, 209, 1),
              Color.fromRGBO(170, 26, 193, 1),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: widget.status == ButtonStatus.active
                  ? Colors.transparent
                  : Color.fromRGBO(101, 122, 136, 1.0),
              minimumSize: Size.fromHeight(60),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              )),
          onPressed:
              widget.status == ButtonStatus.active ? widget.onPressed : null,
          child: buttonChild),
    );
  }
}
