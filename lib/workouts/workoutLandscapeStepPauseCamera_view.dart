import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:ionicons/ionicons.dart';

import '../main.dart';

class WorkoutLandscapeStepPauseCamera extends StatefulWidget {
  WorkoutLandscapeStepPauseCamera(
      {Key? key,
      required this.title,
      required this.customPaint,
      required this.onImage,
      this.initialDirection = CameraLensDirection.back})
      : super(key: key);

  final String title;
  final CustomPaint? customPaint;
  final Function(InputImage inputImage) onImage;
  final CameraLensDirection initialDirection;

  @override
  _WorkoutLandscapeStepPauseCameraState createState() =>
      _WorkoutLandscapeStepPauseCameraState();
}

class _WorkoutLandscapeStepPauseCameraState
    extends State<WorkoutLandscapeStepPauseCamera> {
  CameraController? _controller;

  @override
  void initState() {
    super.initState();
    _startLiveFeed();
  }

  @override
  void dispose() {
    _stopLiveFeed();
    super.dispose();
  }

  Widget _landscapeMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(color: color_dark),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
            ),
            LinearProgressIndicator(
              value: 0.6,
              valueColor: AlwaysStoppedAnimation(color_dimmedTeal),
              backgroundColor: color_dark,
              semanticsLabel: 'Linear progress indicator',
            ),
            Positioned(
                top: (MediaQuery.of(context).size.height * 0.14) / 4,
                left: 25,
                child: Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text("1",
                          style: const TextStyle(
                              color: color_dark,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 36.0),
                          textAlign: TextAlign.center),
                    ))),
            Positioned(
                top: (MediaQuery.of(context).size.height * 0.14) / 10,
                left: (MediaQuery.of(context).size.height * 0.105) + 40,
                child: Container(
                    // color: Colors.red,
                    width: (MediaQuery.of(context).size.width * 0.8),
                    height: MediaQuery.of(context).size.height * 0.5 / 2.5,
                    child: Center(
                      child: Text("Chess Stretch",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.center),
                    ))),
            Positioned(
              bottom: 0,
              left: MediaQuery.of(context).size.width / 2 - 13,
              child: Center(
                  child: SvgPicture.asset(
                'assets/Icon/Detail Expand Icon.svg', // dot dot dot
                height: 26,
              )),
            )
          ],
        ),
        Stack(children: <Widget>[
          Stack(children: <Widget>[
            Container(
                decoration: new BoxDecoration(color: color_white),
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height * 0.25),
                width: MediaQuery.of(context).size.width,
                child: Stack(fit: StackFit.expand, children: <Widget>[
                  CameraPreview(_controller!),
                  if (widget.customPaint != null) widget.customPaint!,
                ]))
          ]),
          Positioned(
              child: Center(
                  child: Container(
            width: MediaQuery.of(context).size.width * 0.46,
            height: MediaQuery.of(context).size.height * 0.32,
            decoration: new BoxDecoration(
                color: Color(0xb20c2b42),
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(15),
                  bottomRight: const Radius.circular(15),
                )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  25,
                  ((MediaQuery.of(context).size.height * 0.14) / 5),
                  25,
                  ((MediaQuery.of(context).size.height * 0.14) / 5)),
              child: Row(
                children: [
                  Container(
                      width: 80,
                      height: 65,
                      child: Column(children: [
                        SvgPicture.asset(
                          'assets/Icon/Miscellaneous-Filled_clock.svg', // dot dot dot
                          height: 30,
                        ),
                        Container(
                          height: 5,
                        ),
                        Text("9:45",
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.center),
                      ])),
                  Container(
                      width: 80,
                      height: 65,
                      child: Column(children: [
                        Icon(
                          Ionicons.flame,
                          size: 30,
                          color: color_white,
                        ),
                        Container(
                          height: 5,
                        ),
                        Text("500 KCAL",
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.center),
                      ])),
                  Expanded(child: Container()),
                  Container(
                    child: SvgPicture.asset(
                      'assets/Icon/Button_pause.svg', // dot dot dot
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
          )))
        ]),
      ],
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
    return Scaffold(body: OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _portraitMode();
        } else {
          return _landscapeMode();
        }
      },
    ));
  }

  Future _startLiveFeed() async {
    final camera = cameras[1];
    _controller = CameraController(
      camera,
      ResolutionPreset.low,
      enableAudio: false,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.startImageStream(_processCameraImage);
      setState(() {});
    });
  }

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Future _processCameraImage(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());

    final camera = cameras[1];
    final imageRotation =
        InputImageRotationMethods.fromRawValue(camera.sensorOrientation) ??
            InputImageRotation.Rotation_0deg;

    final inputImageFormat =
        InputImageFormatMethods.fromRawValue(image.format.raw) ??
            InputImageFormat.NV21;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    widget.onImage(inputImage);
  }
}
