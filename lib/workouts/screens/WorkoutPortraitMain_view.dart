import 'dart:io';
import 'package:fitness_coaching_application_test/workouts/widgets/CameraView.dart';

import '../../exerciseSumFinished_view.dart';
import '../widgets/CurrentExerciseStateBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../loading_view.dart';
import '../pose_painter.dart';
import '../widgets/TeachView.dart';

import 'package:fca_pose_validation/fca_pose_processor.dart';

import 'dart:async' as dartAsync;
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class WorkoutMainView extends StatefulWidget {
  String courseId;
  String courseDataUrl;

  WorkoutMainView({required this.courseId, required this.courseDataUrl});

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

  double teachingVideoProgress = 0.0;

  String stepName = "";
  String criteria = "";
  String criteriaValue = "0";

  String poseSuggestionString = "";
  int fps = 0;

  bool isStepComplete = false;
  Timer? stepCompleteTimer;

  late final Future? futureLoadData;

  Widget? bodyWidget;
  DisplayState currentDisplayState = DisplayState.preExercise;

  @override
  void dispose() async {
    super.dispose();
    await poseDetector.close();
  }

  void onDisplayStateChange(DisplayState state) {
    setState(() {
      currentDisplayState = state;
    });
  }

  void onStepComplete() {
    if (!controller.getCurrentState().exerciseCompleted()) {
      // Step completed, display correct tick for 5 seconds
      setState(() {
        isStepComplete = true;
      });
      dartAsync.Timer.periodic(Duration(seconds: 5), (timer) {
        timer.cancel();
        setState(() {
          isStepComplete = false;
        });
      });
    }
  }

  void onExerciseComplete() {
    var summary = controller.getExerciseSummary();
    var exerciseData = {
      'courseId': widget.courseId,
      'duration': summary.exerciseDuration,
      'score': summary.score
    };
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => ExerciseSumFinished(
                courseId: widget.courseId,
                duration: summary.exerciseDuration,
                score: summary.score)),
        (route) => false);
  }

  Future<String> loadData() async {
    final directory = await getApplicationDocumentsDirectory();
    final downloadPath = '${directory.path}/courses/course.yaml';
    await Dio().download(widget.courseDataUrl, downloadPath);

    var file = File(downloadPath);
    data = await file.readAsString();
    print(data);
    controller = ExerciseController(data,
        onDisplayStateChange: onDisplayStateChange,
        onStepComplete: onStepComplete,
        onExerciseComplete: onExerciseComplete);

    currentState = controller.getCurrentState();
    stepName = currentState.stepName;

    if (currentState.criteria == ExerciseDisplayCriteria.counter) {
      criteria = "Count";
    } else {
      criteria = "Timer";
    }
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CurrentExerciseStateBar(
                      currentState: controller.getCurrentState(),
                      isComplete: isStepComplete,
                      teachingVideoProgress: teachingVideoProgress,
                    ),
                    (() {
                      if (isStepComplete) {
                        return Text("Complete");
                      }
                      if (currentDisplayState == DisplayState.teach) {
                        return TeachView(
                          mediaUrl: controller
                              .definition
                              .steps[controller.getCurrentState().currentStep]
                              .mediaDir,
                          onComplete: () {
                            controller.teachCompleted();
                          },
                          updateMediaProgress: (progress) {
                            setState(() {
                              teachingVideoProgress = progress;
                            });
                          },
                        );
                      }
                      return CameraView(
                        customPaint: customPaint,
                        onImage: (InputImage inputImage) =>
                            processImage(inputImage),
                      );
                    }())
                  ]),
            );
          }
        });
  }

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final poses = await poseDetector.processImage(inputImage);
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
  }

  Future<void> processPose(Pose pose) async {
    controller.setPose(pose);
    controller.update();
  }
}
