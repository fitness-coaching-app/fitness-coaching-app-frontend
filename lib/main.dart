import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';
import 'environment.dart';
import 'signIn_view.dart';

import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: Environment.fileName);
  cameras = await availableCameras();
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
      home: MyHomePage(),

      // home: SignIn(),
      // home: Home(),
      // home: ForgotPassword0(),
      // home: ForgotPassword1(),
      // home: Register0(),
      // home: Register1(),
      // home: Register2(),
      // home: Register3(),
      // home: Register4(),
      // home: NewUserSetup0(),
      // home: NewUserSetupGender(),
      // home: NewUserSetupBd(),
      // home: NewUserSetupExPref(),
      // home: NewUserSetupComp(),
      // home: NewUserSetupWeight(),
      // home: NewUserSetupExPref2(),
      // home: ExerciseSummary(),
      // home: ExerciseSumFinished(),
      // home: WorkoutDetail(),
      // home: WorkoutPortraitWarnning(),
      // home: WorkoutPortraitStepCounting(),
      // home: WorkoutPortraitStepBegin(),
      // home: WorkoutPortraitStepFinish(),
      // home: WorkoutPortraitAlignCamera(),
      // home: WorkoutPortraitStepPause(),
      // home: WorkoutLandscapeAlignCamera(),
      // home: WorkoutLandscapeStepBegin(),
      // home: WorkoutLandscapeStepCounting(),
      // home: WorkoutLandscapeStepFinish(),
      // home: WorkoutLandscapeStepPause(),
      // home: WorkoutLandscapeWarnning(),
      // home: Loading(),
      // home: PoseDetectorView(),
      // home: UserProfileAct(),
      // home: UserProfileAchieve(),
      // home: UserProfileFollower(),
      // home: SearchAllCourse(
      //   searchText: 'exercise',
      // ),
      // home: SearchAllPeople(searchText: "searchText"),
      // home: SearchResult(),
      // home: Searching(),
      // home: LeaderboardGlobal(),
      // home: NewsFeed(),
      // home: NewsArticle(
      //   newsHeader: "header",
      //   newsDetails: "details1",
      //   likes: "10",
      //   picture:
      //       "https://www.helpguide.org/wp-content/uploads/resistance-band-woman-doing-leg-workout-768.jpg",
      // ),
      // home: Activity(),
      // home: ActivityDetail(
      //   picture:
      //       'https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg',
      //   urls: "https://miro.medium.com/max/512/1*pIpmkYQndBoUfa8Uxs1Tjw.jpeg",
      //   username: "username",
      //   comments: [
      //     ["username1", "username2", "username2"],
      //     ["comments1", "comments2", "comments2"],
      //   ],
      //   likesUsername: [
      //     ["username1", "username2", "username1", "username2"],
      //     ["like", "haha", "like", "haha"]
      //   ],
      //   time: DateTime.parse("2022-04-03 20:18:04Z"),
      // ),
      // home: UserSettingsPassword(),
      // home: SearchResult(),
      // home: Activity(),
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                    child: new GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        },
                        child: Container(
                            height: 60,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.5),
                              child: new Text("Get Started",
                                  style: const TextStyle(
                                      color: color_dark,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.0),
                                  textAlign: TextAlign.center),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: color_teal))),
                  )
                ]),
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
  }
}
