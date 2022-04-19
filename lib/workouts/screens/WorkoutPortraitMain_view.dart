import 'package:fitness_coaching_application_test/workouts/widgets/CameraView.dart';

import '../widgets/CurrentExerciseStateBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../loading_view.dart';
import '../pose_painter.dart';
import '../workoutPortraitStepBeginCamera_view.dart';

import 'package:fca_pose_validation/fca_pose_processor.dart';

import 'dart:isolate';

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

  void onDisplayStateChange(DisplayState state) {
    print("onDisplayStateChange CALLED");
    if (state == DisplayState.teach) {
      controller.teachCompleted();
    }
  }

  Future<String> loadData() async {
    // TODO: load course data from the API
    data = await rootBundle.loadString('assets/yaml/jumping-jacks.yaml');
    controller =
        ExerciseController(data, onDisplayStateChange: onDisplayStateChange);
    currentState = controller.getCurrentState();
    stepName = currentState.stepName;

    if (currentState.criteria == ExerciseDisplayCriteria.counter) {
      criteria = "Count";
    } else {
      criteria = "Timer";
    }
    print("OK...");
    controller.preExerciseCompleted();

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
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
            return Material(
              child: Column(children: <Widget>[
                CurrentExerciseStateBar(
                    currentState: controller.getCurrentState()),
                CameraView(
                  customPaint: customPaint,
                  onImage: (InputImage inputImage) => processImage(inputImage),
                )
              ]),
            );
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
    if (poses.isNotEmpty) processPose(poses[0]);
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
      // print("FPS = $fps");
    });
    // print(
    //     "Process time: ${stopTime.difference(time).inMilliseconds} ms | ${detectionTime.difference(time).inMicroseconds} us | ${poseProcessorTime.difference(detectionTime).inMicroseconds} us");
  }

  Future<void> processPose(Pose pose) async {
    controller.setPose(pose);
    controller.update();
  }
}
