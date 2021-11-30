import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import 'main.dart';

class WorkoutPortraitStepCountingCamera extends StatefulWidget {
  WorkoutPortraitStepCountingCamera(
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
  _WorkoutPortraitStepCountingCameraState createState() =>
      _WorkoutPortraitStepCountingCameraState();
}

class _WorkoutPortraitStepCountingCameraState
    extends State<WorkoutPortraitStepCountingCamera> {
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

  Widget _portraitMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
                decoration: new BoxDecoration(color: color_dark),
                height: MediaQuery.of(context).size.height * 0.14,
                width: MediaQuery.of(context).size.width,
                child: LinearProgressIndicator(
                  value: 0.6,
                  valueColor: AlwaysStoppedAnimation(color_dimmedTeal),
                  backgroundColor: color_dark,
                  semanticsLabel: 'Linear progress indicator',
                )),
            Positioned(
                top: (MediaQuery.of(context).size.height * 0.14) / 4,
                right: 25,
                child: Text("00:00",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 36.0),
                    textAlign: TextAlign.center)),
            Positioned(
                top: (MediaQuery.of(context).size.height * 0.14) / 10,
                right: (MediaQuery.of(context).size.height * 0.105) * 2,
                child: Container(
                    width: (MediaQuery.of(context).size.width -
                        ((MediaQuery.of(context).size.height * 0.105) + 75)),
                    height: MediaQuery.of(context).size.height * 0.105,
                    child: Center(
                      child: Text("Chest Stretch",
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
          Container(
            decoration: new BoxDecoration(color: color_white),
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height * 0.14),
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
              bottom: 47,
              left: 25,
              child: Stack(children: <Widget>[
                Container(
                  decoration: new BoxDecoration(color: color_white),
                  height: MediaQuery.of(context).size.height * 0.24,
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      CameraPreview(_controller!),
                      if (widget.customPaint != null) widget.customPaint!,
                    ],
                  ),
                ),
              ]))
        ]),
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
