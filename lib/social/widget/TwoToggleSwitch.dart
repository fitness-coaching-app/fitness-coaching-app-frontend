import 'package:flutter/material.dart';

class TwoToggleSwitch extends StatefulWidget {
  final BuildContext context;
  final String options1;
  final String options2;
  final StatefulWidget screenTo;
  final bool selectOptn1;

  TwoToggleSwitch(
      {Key? key,
      required this.context,
      required this.options1,
      required this.options2,
      required this.screenTo,
      required this.selectOptn1})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => TwoToggleSwitchState();
}

class TwoToggleSwitchState extends State<TwoToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Color(0xFFefefef), borderRadius: BorderRadius.circular(40)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          GestureDetector(
              onTap: () {
                if (widget.selectOptn1 == false) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widget.screenTo),
                  );
                }
              },
              child: Container(
                  height: 40,
                  width: (MediaQuery.of(context).size.width / 2) - 25,
                  decoration: BoxDecoration(
                      color: widget.selectOptn1 == false
                          ? Color(0xFFefefef)
                          : Color(0xFFC0FFD9),
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(widget.options1,
                        style: TextStyle(
                            color: widget.selectOptn1 == false
                                ? Color(0xffc9c9c9)
                                : Color(0xff00a682),
                            fontWeight: widget.selectOptn1 == false
                                ? FontWeight.w400
                                : FontWeight.w600,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.center),
                  ))),
          Expanded(child: Container()),
          GestureDetector(
              onTap: () {
                if (widget.selectOptn1 == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widget.screenTo),
                  );
                }
              },
              child: Container(
                  height: 40,
                  width: (MediaQuery.of(context).size.width / 2) - 25,
                  decoration: BoxDecoration(
                      color: widget.selectOptn1 == true
                          ? Color(0xFFefefef)
                          : Color(0xFFC0FFD9),
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                      child: Text(widget.options2,
                          style: TextStyle(
                              color: widget.selectOptn1 == true
                                  ? Color(0xffc9c9c9)
                                  : Color(0xff00a682),
                              fontWeight: widget.selectOptn1 == true
                                  ? FontWeight.w400
                                  : FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.center))))
        ]));
  }
}
