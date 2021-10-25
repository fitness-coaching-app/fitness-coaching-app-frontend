import 'package:flutter/material.dart';
import 'package:flutter_application_2/loading_view.dart';
import 'color.dart';

//New User Setup
class NewUserSetupComp extends StatelessWidget {
  const NewUserSetupComp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: Container()),
            Center(
                child: Text(
              'You’re\nall set',
              style: Theme.of(context).textTheme.headline1,
            )),
            Expanded(child: Container()),
            Center(
                child: Container(
                    height: 56,
                    child: Text("You can now use the app",
                        style: const TextStyle(
                            color: color_lightGrey,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign
                            .center)) // We’ll ask you some questions to personalize your experience.
                ),
            Container(
              //color: Colors.red,
              height: 10,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                    child: new GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loading()),
                          );
                        },
                        child: Container(
                            height: 60,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.5),
                                child: new Text("Let’s Go",
                                    style: const TextStyle(
                                        color: color_dark,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.0),
                                    textAlign: TextAlign.center)),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: color_teal))),
                  )
                ]),
              ), // Next Button
            ),
            Container(
              //color: Colors.red,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
