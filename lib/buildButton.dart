import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatefulWidget {
  final BuildContext context;
  final String name;
  final StatefulWidget screenTo;
  BuildButton(
      {Key? key,
      required this.context,
      required this.name,
      required this.screenTo})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => BuildButtonState();
}

class BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget.screenTo),
                );
              },
              child: Container(
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.5),
                    child: new Text(widget.name,
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
                      color: color_teal))))
    ]);
  }
}
