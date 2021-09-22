import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';
import 'signIn_view.dart';
import 'newUserSetUp1_view.dart';

void main() {
  runApp(MyApp());
}

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
          headline1: GoogleFonts.poppins(
            fontSize: 48.0,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ), //Title Highlight
          subtitle2: GoogleFonts.poppins(fontSize: 16.0), //Normal
          button: GoogleFonts.poppins(
              fontSize: 22.0, fontWeight: FontWeight.w600), //main button text
          overline: GoogleFonts.poppins(
              fontSize: 16.0, fontWeight: FontWeight.w600), //Tappable Text
          headline2: GoogleFonts.poppins(
              fontSize: 28.0, fontWeight: FontWeight.bold), //title1
          headline4: GoogleFonts.poppins(
              fontSize: 20.0, fontWeight: FontWeight.w600), //title2
          bodyText1: GoogleFonts.poppins(
              fontSize: 14.0, fontWeight: FontWeight.w600), // Text Heading
          bodyText2: GoogleFonts.poppins(fontSize: 14.0), // Text Heading
          caption: GoogleFonts.poppins(fontSize: 12.0), //tiny text
          subtitle1: GoogleFonts.poppins(
              fontSize: 12.0, fontWeight: FontWeight.w600), //title heading
          headline3: GoogleFonts.poppins(
              fontSize: 28.0, fontWeight: FontWeight.w600), //title 1.5
        ),
      ),
      //home: MyHomePage(),
      //home: NewUserSetup(),
      home: SignIn(),
    );
  }
}

//home
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
  }}