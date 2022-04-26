import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';

class RenderCircularProgress extends StatefulWidget {
  final String percentage;

  RenderCircularProgress({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RenderCircularProgressState();
}

class RenderCircularProgressState extends State<RenderCircularProgress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 155.0,
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: 155,
                  height: 155,
                  child: new CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(color_purple),
                    backgroundColor: color_lightGrey,
                    value: double.parse(widget.percentage) / 100,
                    strokeWidth: 7,
                  ),
                ),
              ),
              Center(
                  child: Text(widget.percentage + " %",
                      style: const TextStyle(
                          color: color_purple,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 40.0),
                      textAlign: TextAlign.center)),
            ],
          ),
        ),
      ],
    );
  }
}
