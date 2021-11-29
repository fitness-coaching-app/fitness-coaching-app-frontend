import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'color.dart';

class WorkoutLandscapeAlignCamera extends StatefulWidget {
  const WorkoutLandscapeAlignCamera({Key? key}) : super(key: key);
  @override
  _WorkoutLandscapeAlignCameraState createState() =>
      _WorkoutLandscapeAlignCameraState();
}

class _WorkoutLandscapeAlignCameraState
    extends State<WorkoutLandscapeAlignCamera> {
  Widget _landscapeMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return SafeArea(
      child: Column(
        children: [
          Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height - 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://i.kym-cdn.com/photos/images/newsfeed/000/002/110/longcat.jpg?1241726484'),
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                    Positioned(
                      top: (MediaQuery.of(context).size.height * 0.2) - 20,
                      left: (MediaQuery.of(context).size.width) / 2.4,
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/Icon/Workouts.svg', // dot dot dot
                        height: 116,
                      )),
                    ),
                    Positioned(
                      top: (MediaQuery.of(context).size.height * 0.6) - 30,
                      left: (MediaQuery.of(context).size.width) / 2.8,
                      child: Center(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Text("Please align your phone",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.center),
                      )),
                    )
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _portraitMode() {
    return SafeArea(
        child: new Container(
            decoration: new BoxDecoration(color: color_white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Icon/Miscellaneous-Outline_phone_hor.svg', // dot dot dot
                  height: 100,
                ),
                Container(
                  height: 15,
                ),
                Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text("Please rotate your device horizontally",
                      style: const TextStyle(
                          color: color_dark,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0),
                      textAlign: TextAlign.center),
                )),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _portraitMode();
          } else {
            return _landscapeMode();
          }
        },
      ),
    );
  }
}
