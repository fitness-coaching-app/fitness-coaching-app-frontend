import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'color.dart';
import 'package:flutter/services.dart';

class WorkoutPortraitAlignCamera extends StatefulWidget {
  const WorkoutPortraitAlignCamera({Key? key}) : super(key: key);
  @override
  _WorkoutPortraitAlignCameraState createState() =>
      _WorkoutPortraitAlignCameraState();
}

class _WorkoutPortraitAlignCameraState
    extends State<WorkoutPortraitAlignCamera> {
  Widget _portraitMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Column(
        children: [
          Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://i.kym-cdn.com/photos/images/newsfeed/000/002/110/longcat.jpg?1241726484'),
                          fit: BoxFit.fill,
                        ),
                      )),
                  Positioned(
                    top: (MediaQuery.of(context).size.height * 0.3) - 20,
                    left: (MediaQuery.of(context).size.width) / 3,
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/Icon/Workouts.svg', // dot dot dot
                      height: 116,
                    )),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.height * 0.5) - 30,
                    left: (MediaQuery.of(context).size.width) / 5,
                    child: Center(
                        child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
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
          ),
        ],
      );
  }

  Widget _landscapeMode() {
    return SafeArea(
        child: new Container(
            decoration: new BoxDecoration(color: color_white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Icon/Miscellaneous-Outline_phone.svg', // dot dot dot
                  height: 100,
                ),
                Container(
                  height: 15,
                ),
                Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text("Please rotate your device vertically",
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
