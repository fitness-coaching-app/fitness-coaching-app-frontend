import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const Color color_dark = Color(0xFF0C2B42);
const Color color_teal = Color(0xFF07EBB9);

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  primary: color_teal, //change background color of button
  onPrimary: color_dark, //change text color of button
  fixedSize: Size(325, 66),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
  elevation: 5.0,
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        //brightness: Brightness.dark,
        //primaryColor: Colors.lightBlue[800],
        //accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Poppins',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
              color: Colors.white), //Title Highlight
          subtitle2: TextStyle(fontSize: 16.0), //Normal
          button: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.w600), //main button text
          overline: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w600), //Tappable Text
          headline2:
              TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold), //title1
          headline4:
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600), //title2
          bodyText1: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w600), // Text Heading
          bodyText2: TextStyle(fontSize: 14.0), // Text Heading
          caption: TextStyle(fontSize: 12.0), //tiny text
          subtitle1: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w600), //title heading
          headline3: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.w600), //title 1.5
        ),
      ),
      //home: MyHomePage(),
      home: NewUserSetup(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
              'FIT+',
              style: Theme.of(context).textTheme.headline1,
            )),
            Expanded(child: Container()),
            Center(
                child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: Text(
                'Get started',
                style: Theme.of(context).textTheme.button,
              ),
            )),
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

class NewUserSetup extends StatelessWidget {
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
              'Welcome to',
              style: Theme.of(context).textTheme.headline1,
            )),
            Center(
                child: Text(
              'FIT+',
              style: Theme.of(context).textTheme.headline1,
            )),
            Expanded(child: Container()),
            Center(
              child: Text(
                'We’ll ask you some questions to',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Center(
              child: Text(
                'personalize your experience.',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Container(
              //color: Colors.red,
              height: 10,
            ),
            Center(
                child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: Text(
                'Get started',
                style: Theme.of(context).textTheme.button,
              ),
            )),
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
