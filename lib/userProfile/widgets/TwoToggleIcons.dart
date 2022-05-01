import 'package:flutter/material.dart';

class TwoToggleIcons extends StatefulWidget {
  final IconData options1;
  final IconData options2;
  final Function(int option)? onChanged;

  TwoToggleIcons(
      {Key? key,
      required this.options1,
      required this.options2,
      this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => TwoToggleIconsState();
}

class TwoToggleIconsState extends State<TwoToggleIcons> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Color(0xFFefefef), borderRadius: BorderRadius.circular(40)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (selectedOption == 2) {
                setState(() {
                  selectedOption = 1;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(selectedOption);
                }
              }
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                      color: selectedOption == 1? Color(0xFFC0FFD9) : Colors.transparent,
                      borderRadius: BorderRadius.circular(40)),
              child: Icon(
                widget.options1,
                color:
                    selectedOption == 2 ? Color(0xffc9c9c9) : Color(0xFF00A682),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (selectedOption == 1) {
                setState(() {
                  selectedOption = 2;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(selectedOption);
                }
              }
            },
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                      color: selectedOption == 2? Color(0xFFC0FFD9) : Colors.transparent,
                      borderRadius: BorderRadius.circular(40)),
                child: Icon(
                  widget.options2,
                  color: selectedOption == 1
                      ? Color(0xffc9c9c9)
                      : Color(0xFF00A682),
                )),
          ),
        ),
      ]),
    );
  }
}
