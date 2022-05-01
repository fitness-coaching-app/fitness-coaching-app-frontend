import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'api_util.dart';
import 'color.dart';
import 'components/main_button_highlight.dart';
import 'environment.dart';
import 'home/screen/home_view.dart';
import 'loading_view.dart';
import 'signIn_view.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: Environment.fileName);
  cameras = await availableCameras();

  await Hive.initFlutter();
  await Hive.openBox('token');
  await Hive.openBox('user');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          ),
          //Title Highlight
          subtitle2: GoogleFonts.poppins(fontSize: 16.0),
          //Normal
          button:
              GoogleFonts.poppins(fontSize: 22.0, fontWeight: FontWeight.w600),
          //main button text
          overline:
              GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600),
          //Tappable Text
          headline2:
              GoogleFonts.poppins(fontSize: 28.0, fontWeight: FontWeight.bold),
          //title1
          headline4:
              GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w600),
          //title2
          bodyText1:
              GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600),
          // Text Heading
          bodyText2: GoogleFonts.poppins(fontSize: 14.0),
          // Text Heading
          caption: GoogleFonts.poppins(fontSize: 12.0),
          //tiny text
          subtitle1:
              GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w600),
          //title heading
          headline3: GoogleFonts.poppins(
              fontSize: 28.0, fontWeight: FontWeight.w600), //title 1.5
        ),
      ),
      home: MyHomePage(),
      // home: Register4(),
      // home: NewUserSetup0(),
    );
  }
}

//home
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future? checkTokenFuture;

  Future<bool> checkToken() async {
    if (Hive.box('token').get('accessToken') == null) return false;

    var response = await API.get(Environment.getUserInfoUrl, withToken: true);
    response.fold((l) {
      print(l.message);
    }, (r) {
      Hive.box('user').put('data', r.results!);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (route) => Home()), (route) => false);
    });
    return true;
  }

  @override
  void initState() {
    super.initState();
    checkTokenFuture = checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkTokenFuture,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: color_dark,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: Container()),
                  Center(
                      child: Text("FIT+",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 48.0),
                          textAlign: TextAlign.center)),
                  Expanded(child: Container()),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: MainButtonHighlight(
                          text: "Get Started",
                          onPressed: () async {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    settings: RouteSettings(name: "/SignIn"),
                                    builder: (context) => SignIn()));
                          }),
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    height: 50,
                  )
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
