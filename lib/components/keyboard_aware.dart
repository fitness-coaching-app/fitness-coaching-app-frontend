import 'package:flutter/cupertino.dart';

class KeyboardAwareView extends StatefulWidget {
  Widget child;

  KeyboardAwareView({required this.child});

  @override
  State<StatefulWidget> createState() => _KeyboardAwareViewState();
}

class _KeyboardAwareViewState extends State<KeyboardAwareView> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height),
              child: IntrinsicHeight(child: widget.child))),
    );
  }
}
