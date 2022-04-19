import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../loading_view.dart';
import 'pose_painter.dart';
import 'WorkoutPortraitWarningCamera_view.dart';
import 'workoutLandscapeStepCountingCamera_view.dart';
import 'workoutLandscapeStepPauseCamera_view.dart';
import 'workoutPortraitStepBeginCamera_view.dart';

import 'workoutPortraitStepCountingCamera_view.dart';
import 'workoutPortraitStepFinishCamera_view.dart';
import 'workoutPortraitStepPauseCamera_view.dart';

import 'package:fca_pose_validation/fca_pose_processor.dart';
// import 'package:fca_pose_validation/src/touch_checker.dart';

class WorkoutMainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkoutMainViewState();
}

class _WorkoutMainViewState extends State<WorkoutMainView> {
  PoseDetector poseDetector = GoogleMlKit.vision.poseDetector(
      poseDetectorOptions: PoseDetectorOptions(
          model: PoseDetectionModel.base, mode: PoseDetectionMode.streamImage));
  bool isBusy = false;
  bool isLoaded = false;
  CustomPaint? customPaint;
  late String data;
  late ExerciseController controller;
  late ExerciseState currentState;

  String stepName = "";
  String criteria = "";
  String criteriaValue = "0";

  String poseSuggestionString = "";
  int fps = 0;

  late final Future? futureLoadData;

  @override
  void dispose() async {
    super.dispose();
    await poseDetector.close();
  }

  Future<String> loadData() async {
    // TODO: load course data from the API
    data = await rootBundle.loadString('assets/yaml/jumping-jacks.yaml');
    controller = ExerciseController(data);
    currentState = controller.getCurrentState();
    stepName = currentState.stepName;

    if (currentState.criteria == ExerciseDisplayCriteria.counter) {
      criteria = "Count";
    } else {
      criteria = "Timer";
    }
    print("OK...");

    return "OK";
  }

  @override
  void initState() {
    super.initState();
    futureLoadData = loadData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureLoadData,
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (!snap.hasData) {
            return Loading();
          } else {
            return WorkoutPortraitStepBeginCamera(
                customPaint: customPaint,
                stepName: stepName,
                onImage: (inputImage) {
                  processImage(inputImage);
                });
          }
        });
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
    setState(() {
      fps = ((1 / stopTime.difference(time).inMilliseconds) * 1000).toInt();
    });
    // print(
    //     "Process time: ${stopTime.difference(time).inMilliseconds} ms | ${detectionTime.difference(time).inMicroseconds} us | ${poseProcessorTime.difference(detectionTime).inMicroseconds} us");
  }

  Future<void> poseProcessorTest(Pose pose) async {
    controller.setPose(pose);
    controller.update();
    setState(() {
      poseSuggestionString =
          controller.getCurrentState().getWarning()["warningMessage"];
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