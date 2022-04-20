import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TeachView extends StatefulWidget {
  final Function? onComplete;

  TeachView({
    this.onComplete
  });

  State<StatefulWidget> createState() => _TeachViewState();
}

class _TeachViewState extends State<TeachView> {
  Timer? timer;
  Timer? updateTimer;

  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      this.timer?.cancel();
      if(widget.onComplete != null) widget.onComplete!();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text("Teaching Video...")
    );
  }
}