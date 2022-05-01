import 'package:flutter/material.dart';

class TwoToggleSwitch extends StatefulWidget {
  final BuildContext context;
  final String options1;
  final String options2;
  final Function(int option)? onChanged;

  TwoToggleSwitch(
      {Key? key,
      required this.context,
      required this.options1,
      required this.options2,
      this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => TwoToggleSwitchState();
}

class TwoToggleSwitchState extends State<TwoToggleSwitch> {
  int options = 1;
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
                if(options != 1){
                  options = 1;
                  if(widget.onChanged != null) {
                    widget.onChanged!(options);
                  }
                }
              },
              child: Container(
                  height: 40,
                  width: (MediaQuery.of(context).size.width / 2) - 25,
                  decoration: BoxDecoration(
                      color: options == 2
                          ? Color(0xFFefefef)
                          : Color(0xFFC0FFD9),
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(widget.options1,
                        style: TextStyle(
                            color: options == 2
                                ? Color(0xffc9c9c9)
                                : Color(0xff00a682),
                            fontWeight: options == 2
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
                if(options != 2){
                  options = 2;
                  if(widget.onChanged != null) {
                    widget.onChanged!(options);
                  }
                }
              },
              child: Container(
                  height: 40,
                  width: (MediaQuery.of(context).size.width / 2) - 25,
                  decoration: BoxDecoration(
                      color: options == 1
                          ? Color(0xFFefefef)
                          : Color(0xFFC0FFD9),
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                      child: Text(widget.options2,
                          style: TextStyle(
                              color: options == 1
                                  ? Color(0xffc9c9c9)
                                  : Color(0xff00a682),
                              fontWeight: options == 1
                                  ? FontWeight.w400
                                  : FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.center))))
        ]));
  }
}
