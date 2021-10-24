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
      body: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              //makes the red row full width
              child: Container(
                color: Colors.redAccent,
                height: 50.0,
                child: Center(
                  child: Text(
                    "Hello World!",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // This expands the row element vertically because it's inside a column
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // This makes the blue container full width.
              Expanded(
                child: Container(
                  color: Colors.blueAccent,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Thanks for the help!",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
