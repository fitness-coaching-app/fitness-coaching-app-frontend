import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import 'coordinates_translator.dart';

class PosePainter extends CustomPainter {
  PosePainter(this.poses, this.absoluteImageSize, this.rotation, this.armAngle, this.elbowAngle);

  final List<Pose> poses;
  final Size absoluteImageSize;
  final InputImageRotation rotation;
  final double armAngle;
  final double elbowAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.green;

    final leftPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.yellow;

    final rightPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.blueAccent;

    final textStyle = TextStyle(
      color: Colors.amber,
      fontSize: 16,
    );
    final textSpan = TextSpan(
      text: 'Left Arm = ' + armAngle.toString() + '\n' + 'Left Elbow = ' + elbowAngle.toString(),
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) - 25;
    final yCenter = (size.height - textPainter.height) - 25;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);

    poses.forEach((pose) {
      pose.landmarks.forEach((_, landmark) {
        canvas.drawCircle(
            Offset(
              translateX(landmark.x, rotation, size, absoluteImageSize),
              translateY(landmark.y, rotation, size, absoluteImageSize),
            ),
            1,
            paint);
      });

      void paintLine(
          PoseLandmarkType type1, PoseLandmarkType type2, Paint paintType) {
        PoseLandmark joint1 = pose.landmarks[type1]!;
        PoseLandmark joint2 = pose.landmarks[type2]!;
        canvas.drawLine(
            Offset(translateX(joint1.x, rotation, size, absoluteImageSize),
                translateY(joint1.y, rotation, size, absoluteImageSize)),
            Offset(translateX(joint2.x, rotation, size, absoluteImageSize),
                translateY(joint2.y, rotation, size, absoluteImageSize)),
            paintType);
      }

      //Draw arms
      paintLine(
          PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow, leftPaint);
      paintLine(
          PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist, leftPaint);
      paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow,
          rightPaint);
      paintLine(
          PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist, rightPaint);

      //Draw Body
      paintLine(
          PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip, leftPaint);
      paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightHip,
          rightPaint);

      //Draw legs
      paintLine(
          PoseLandmarkType.leftHip, PoseLandmarkType.leftAnkle, leftPaint);
      paintLine(
          PoseLandmarkType.rightHip, PoseLandmarkType.rightAnkle, rightPaint);
    });
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.poses != poses;
  }
}