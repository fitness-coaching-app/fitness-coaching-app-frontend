import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/workoutLandscapeStepFinishCamera_view.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import 'WorkoutLandscapeStepBeginCamera_view.dart';
import 'WorkoutLandscapeWarnningCamera_view.dart';
import 'WorkoutPortraitWarnningCamera_view.dart';
import 'workoutLandscapeStepCountingCamera_view.dart';
import 'workoutLandscapeStepFinish_view.dart';
import 'workoutLandscapeStepPauseCamera_view.dart';
import 'workoutPortraitStepBeginCamera_view.dart';
import 'pose_painter.dart';
import 'workoutPortraitStepCountingCamera_view.dart';
import 'workoutPortraitStepFinishCamera_view.dart';
import 'workoutPortraitStepPauseCamera_view.dart';

import 'pose_validator.dart';

var armAngle;
var elbowAngle;

class PoseDetectorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView> {
  PoseDetector poseDetector = GoogleMlKit.vision.poseDetector();
  bool isBusy = false;
  CustomPaint? customPaint;

  @override
  void dispose() async {
    super.dispose();
    await poseDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return WorkoutPortraitStepBeginCamera(
      title: 'Pose Detector',
      customPaint: customPaint,
      onImage: (inputImage) {
        processImage(inputImage);
      },
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final poses = await poseDetector.processImage(inputImage);
    print('Found ${poses.length} poses');
    for (Pose pose in poses) {
      PoseValidator poseValidator = PoseValidator(pose);
      armAngle = poseValidator.getAngle(PoseLandmarkType.leftShoulder,
          PoseLandmarkType.leftHip, PoseLandmarkType.leftElbow);
      elbowAngle = poseValidator.getAngle(PoseLandmarkType.leftElbow,
          PoseLandmarkType.leftShoulder, PoseLandmarkType.leftWrist);
      print('arm = ' + armAngle.toString());
      print('elbow = ' + elbowAngle.toString());

      pose.landmarks.forEach((_, landmark) {
        final type = landmark.type;
        final x = landmark.x;
        final y = landmark.y;
        final z = landmark.z;
        final likelihood = landmark.likelihood;
        // print('$type: PoseLandmark($type, $x, $y, $z, $likelihood)');
        // print('$type: PoseLandmark($type, likelihood: $likelihood)');
        if (inputImage.inputImageData?.size != null &&
            inputImage.inputImageData?.imageRotation != null) {
          final painter = PosePainter(poses, inputImage.inputImageData!.size,
              inputImage.inputImageData!.imageRotation, armAngle, elbowAngle);
          customPaint = CustomPaint(painter: painter);
        } else {
          customPaint = null;
        }
      });
    }
    // print('Found ${poses.length} poses');
    // if (inputImage.inputImageData?.size != null &&
    //     inputImage.inputImageData?.imageRotation != null) {
    //   final painter = PosePainter(poses, inputImage.inputImageData!.size,
    //       inputImage.inputImageData!.imageRotation);
    //   customPaint = CustomPaint(painter: painter);

    // } else {
    //   customPaint = null;
    // }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
