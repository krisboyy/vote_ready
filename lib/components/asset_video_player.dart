import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'video_player_widget.dart';

class AssetVideoPlayer extends StatefulWidget {
  final List<String> assets;
  const AssetVideoPlayer({required this.assets, super.key});

  @override
  State<AssetVideoPlayer> createState() => _AssetVideoPlayerState();
}

class _AssetVideoPlayerState extends State<AssetVideoPlayer> {
  late int currentIndex;
  List<VideoPlayerController> createControllers() {
    return widget.assets.map((path) {
      return VideoPlayerController.asset(path);
    }).toList();
  }

  late List<VideoPlayerController> controllers;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    controllers = createControllers();
    controllers.first
      ..addListener(set)
      ..setLooping(false)
      ..initialize().then((value) => controllers.first.play());
  }

  void _onVideoComplete() {
    // Remove listener from current controller
    controllers[currentIndex].removeListener(_onVideoComplete);

    // Move to the next video
    if (controllers[currentIndex].value.isCompleted) {
      if (currentIndex < controllers.length - 1) {
        currentIndex++;
        controllers[currentIndex]
          ..setLooping(false)
          ..addListener(_onVideoComplete)
          ..initialize().then((_) {
            controllers[currentIndex].play();
            setState(() {});
          });
      }
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: controllers[currentIndex]);
  }
}
