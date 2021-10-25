import 'package:flutter/material.dart';
import 'color.dart';
import 'signIn_view.dart';

//New User Setup
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_lightGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Loading
            Center(
              child: new GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()),
                                  );
                                },
                                child: Text("Loading",
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                  textAlign: TextAlign.center)),
            ),
          ],
        ),
      ),
    );
  }
}
