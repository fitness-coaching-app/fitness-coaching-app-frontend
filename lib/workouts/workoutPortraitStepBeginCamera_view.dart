import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitness_coaching_application_test/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import '../main.dart';

enum ScreenMode { liveFeed, gallery }

class WorkoutPortraitStepBeginCamera extends StatefulWidget {
  WorkoutPortraitStepBeginCamera(
      {Key? key,
      this.customPaint,
      required this.stepName,
      required this.onImage,
      this.initialDirection = CameraLensDirection.front})
      : super(key: key);

  final String stepName;
  final CustomPaint? customPaint;
  final Function(InputImage inputImage) onImage;
  final CameraLensDirection initialDirection;

  @override
  _WorkoutPortraitStepBeginCameraState createState() =>
      _WorkoutPortraitStepBeginCameraState();
}

class _WorkoutPortraitStepBeginCameraState
    extends State<WorkoutPortraitStepBeginCamera> {
  CameraController? _controller;
  int _cameraIndex = 0;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < cameras.length; i++) {
      if (cameras[i].lensDirection == widget.initialDirection) {
        _cameraIndex = i;
      }
    }
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
                    width: (MediaQuery.of(context).size.width -
                        ((MediaQuery.of(context).size.height * 0.105) + 75)),
                    height: MediaQuery.of(context).size.height * 0.105,
                    child: Center(
                      child: Text(widget.stepName,
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
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CameraPreview(_controller!),
                if (widget.customPaint != null) widget.customPaint!,
              ],
            ),
          ),
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
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.low,
      enableAudio: false,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.getMinZoomLevel().then((value) {
        zoomLevel = value;
        minZoomLevel = value;
      });
      _controller?.getMaxZoomLevel().then((value) {
        maxZoomLevel = value;
      });
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

    final camera = cameras[_cameraIndex];
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
