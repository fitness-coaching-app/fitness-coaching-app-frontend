import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../loading_view.dart';

class TeachView extends StatefulWidget {
  final String mediaUrl;
  final Function? onComplete;
  final Function(double value)? updateMediaProgress;

  TeachView({required this.mediaUrl, this.onComplete, this.updateMediaProgress});

  State<StatefulWidget> createState() => _TeachViewState();
}

class _TeachViewState extends State<TeachView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.mediaUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.setVolume(0.0);
        _controller.play();
      });
    _controller.addListener(checkVideo);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return Expanded(
        child: ClipRect(
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: SizedBox(
              width: _controller.value.aspectRatio,
              height: 1,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
      );
    } else {
      return Text("Loading...");
    }
  }

  void checkVideo() {
    if(widget.updateMediaProgress != null) widget.updateMediaProgress!((_controller.value.position.inMicroseconds) / (_controller.value.duration.inMicroseconds));
    if (_controller.value.position == _controller.value.duration) {
      if (widget.onComplete != null) widget.onComplete!();
    }
  }
}
