import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vote_ready/components/alert_dialog.dart';
import 'video_player_widget.dart';

class AssetVideoPlayer extends StatefulWidget {
  final String asset;
  const AssetVideoPlayer({required this.asset, super.key});

  @override
  State<AssetVideoPlayer> createState() => _AssetVideoPlayerState();
}

class _AssetVideoPlayerState extends State<AssetVideoPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.asset)
      ..addListener(() => setState(() {
            if (controller.value.isCompleted) {
              showQuestionPopup(context);
            }
          }))
      ..setLooping(false)
      ..initialize().then((value) => controller.play());
  }

  // void _onVideoComplete() {
  //   // Remove listener from current controller
  //   controllers[currentIndex].removeListener(_onVideoComplete);

  //   // Move to the next video
  //   if (controllers[currentIndex].value.isCompleted) {
  //     if (currentIndex < controllers.length - 1) {
  //       currentIndex++;
  //       controllers[currentIndex]
  //         ..setLooping(false)
  //         ..addListener(_onVideoComplete)
  //         ..initialize().then((_) {
  //           controllers[currentIndex].play();
  //           setState(() {});
  //         });
  //     }
  //   }
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: controller);
  }
}
