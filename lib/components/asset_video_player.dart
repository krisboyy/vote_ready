import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vote_ready/components/show_question.dart';
import 'video_player_widget.dart';

class AssetVideoPlayer extends StatefulWidget {
  final String asset;
  final String question;
  final String crt_ans;
  final String wrg_ans1;
  final String wrg_ans2;

  final String reason;
  final String details;
  final int level;
  const AssetVideoPlayer({required this.asset,  super.key, required this.question, required this.crt_ans, required this.wrg_ans1, required this.wrg_ans2, required this.reason, required this.details, required this.level,});

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
              showQuestionPopup(
                context,
                widget.question,
                widget.crt_ans,
                widget.wrg_ans1,
                widget.wrg_ans2,
                widget.reason,
                widget.details,
                widget.level,
              );
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
