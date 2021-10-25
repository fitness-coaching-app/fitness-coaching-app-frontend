import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';

class TestView extends StatelessWidget {
  static const _from = 0xe900;
  static const _to = 0xee33;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Ionicons'),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 72,
        children: List.generate(_to - _from + 1, (index) {
          final code = index + _from;
          return Column(
            children: [
              Icon(Ionicons.arrow_back, size: 48),
              Text(code.toRadixString(16)),
            ],
          );
        }),
      ),
    );
  }
}