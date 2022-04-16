import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitness_coaching_application_test/workoutLandscapeStepFinishCamera_view.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import 'WorkoutLandscapeStepBeginCamera_view.dart';
import 'WorkoutLandscapeWarnningCamera_view.dart';
import 'pose_painter.dart';
import 'workoutPortraitWarnningCamera_view.dart';
import 'workoutLandscapeStepCountingCamera_view.dart';
import 'workoutLandscapeStepFinish_view.dart';
import 'workoutLandscapeStepPauseCamera_view.dart';
import 'workoutPortraitStepBeginCamera_view.dart';

import 'workoutPortraitStepCountingCamera_view.dart';
import 'workoutPortraitStepFinishCamera_view.dart';
import 'workoutPortraitStepPauseCamera_view.dart';

import 'package:fca_pose_validation/fca_pose_processor.dart';
// import 'package:fca_pose_validation/src/touch_checker.dart';

class PoseDetectorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView> {
  // PoseDetector poseDetector = GoogleMlKit.vision.poseDetector();
  // bool isBusy = false;
  // CustomPaint? customPaint;

  PoseDetector poseDetector = GoogleMlKit.vision.poseDetector(
      poseDetectorOptions: PoseDetectorOptions(
          model: PoseDetectionModel.base, mode: PoseDetectionMode.streamImage));
  bool isBusy = false;
  CustomPaint? customPaint;
  late String data;
  late ExerciseController controller;
  late ExerciseState currentState;

  String criteria = "";
  String criteriaValue = "0";

  String poseSuggestionString = "";
  int fps = 0;

  @override
  void dispose() async {
    super.dispose();
    await poseDetector.close();
  }

  _asyncMethod() async {
    data = await rootBundle.loadString('assets/jumping-jacks.yaml');
    controller = ExerciseController(data);
    currentState = controller.getCurrentState();

    if (currentState.criteria == ExerciseDisplayCriteria.counter) {
      criteria = "Count";
    } else {
      criteria = "Timer";
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      WorkoutPortraitStepBeginCamera(
        title: 'Pose Detector',
        customPaint: customPaint,
        onImage: (inputImage) {
          processImage(inputImage);
        },
      ),
      Positioned(
          bottom: 30,
          left: 20,
          child: Row(children: <Widget>[
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  controller.dumpLogToFile(
                      "squats-10_${DateTime.now().toUtc().toString()}");
                },
                child: Text("Save to Log")),
            SizedBox(width: 25),
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  // controller.dumpLogToFile('test');
                },
                child: Text("Clear Log"))
          ])),
      Positioned(
        top: 100,
        left: 20,
        child: Column(children: <Widget>[
          Text("$criteria: $criteriaValue\nSuggestion: $poseSuggestionString",
              style: TextStyle(
                backgroundColor: Colors.black,
                color: Colors.white,
                fontSize: 12
              ))
        ]),
      ),
      Positioned(
          top: 130,
          right: 20,
          child: Text("$fps fps",
              style: TextStyle(
                backgroundColor: Colors.black,
                color: Colors.white,
                fontSize: 12
              )))
    ]);
  }

  Future<void> processImage(InputImage inputImage) async {
    final DateTime time = DateTime.now();
    if (isBusy) return;
    isBusy = true;
    final poses = await poseDetector.processImage(inputImage);
    final DateTime detectionTime = DateTime.now();
    // print('Found ${poses.length} poses');
    if (poses.isNotEmpty) poseProcessorTest(poses[0]);
    final DateTime poseProcessorTime = DateTime.now();
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = PosePainter(poses, inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation);
      customPaint = CustomPaint(painter: painter);
    } else {
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
    final DateTime stopTime = DateTime.now();
    setState((){
      fps = ((1 / stopTime.difference(time).inMilliseconds) * 1000).toInt();
    });
    // print(
    //     "Process time: ${stopTime.difference(time).inMilliseconds} ms | ${detectionTime.difference(time).inMicroseconds} us | ${poseProcessorTime.difference(detectionTime).inMicroseconds} us");
  }

    Future<void> poseProcessorTest(Pose pose) async {
    controller.setPose(pose);
    controller.update();
    setState(() {
      poseSuggestionString = controller.getCurrentState().getWarning()["warningMessage"];
      if (controller.getCurrentState().criteria ==
          ExerciseDisplayCriteria.counter) {
        criteria = "Count";
        criteriaValue = controller.getCurrentState().repeatCount.toString();
      } else {
        criteria = "Timer";
        criteriaValue =
            controller.getCurrentState().timer.elapsedMilliseconds.toString() +
                " ms";
      }
    });
  }

}

  // Future<void> processImage(InputImage inputImage) async {
  //   if (isBusy) return;
  //   isBusy = true;
  //   final poses = await poseDetector.processImage(inputImage);
  //   print('Found ${poses.length} poses');
  //   for (Pose pose in poses) {
      // angle
      // PoseValidator poseValidator = PoseValidator(pose);
      // armAngle = poseValidator.getAngle(PoseLandmarkType.leftShoulder,
      //     PoseLandmarkType.leftHip, PoseLandmarkType.leftElbow);
      // elbowAngle = poseValidator.getAngle(PoseLandmarkType.leftElbow,
      //     PoseLandmarkType.leftShoulder, PoseLandmarkType.leftWrist);
      // print('arm = ' + armAngle.toString());
      // print('elbow = ' + elbowAngle.toString());

      //touch checker
      // TouchChecker touchChecker = TouchChecker();
      // touchChecker.setPose(pose);
      // var checkLeftRightHand = touchChecker.touchChecker(
      //     PoseLandmarkType.leftWrist, PoseLandmarkType.rightWrist);
      // print(
      //     'check left and right wrist touch: ' + checkLeftRightHand.toString());

      // pose.landmarks.forEach((_, landmark) {
      //   final type = landmark.type;
      //   final x = landmark.x;
      //   final y = landmark.y;
      //   final z = landmark.z;
      //   final likelihood = landmark.likelihood;
      // print('$type: PoseLandmark($type, $x, $y, $z, $likelihood)');
      // print('$type: PoseLandmark($type, likelihood: $likelihood)');
      // if (inputImage.inputImageData?.size != null &&
      //     inputImage.inputImageData?.imageRotation != null) {
      //   // final painter = PosePainter(poses, inputImage.inputImageData!.size,
      //   //     inputImage.inputImageData!.imageRotation, armAngle, elbowAngle);
      //   final painter = PosePainter(poses, inputImage.inputImageData!.size,
      //       inputImage.inputImageData!.imageRotation);
      //   customPaint = CustomPaint(painter: painter);
      // } else {
      //   customPaint = null;
      // }
      // });
    // }
    // print('Found ${poses.length} poses');
    // if (inputImage.inputImageData?.size != null &&
    //     inputImage.inputImageData?.imageRotation != null) {
    //   final painter = PosePainter(poses, inputImage.inputImageData!.size,
    //       inputImage.inputImageData!.imageRotation);
    //   customPaint = CustomPaint(painter: painter);

    // } else {
    //   customPaint = null;
    // }
//     isBusy = false;
//     if (mounted) {
//       setState(() {});
//     }
//   }
// }
