import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vote_ready/components/show_question.dart';
import 'video_player_widget.dart';

class AssetVideoPlayer extends StatefulWidget {
  final String asset;
  final String question;
  final String crt_ans;
  final String option1;
  final String option2;
  final String option3;

  final String reason;
  final String details;
  final int level;
  const AssetVideoPlayer({required this.asset,  super.key, required this.question, required this.crt_ans, required this.reason, required this.details, required this.level, required this.option1, required this.option2, required this.option3,});

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
              QuestionPopup.show(
                context,
                widget.question,
                widget.crt_ans,
                widget.option1,
                widget.option2,
                widget.option3,
                widget.reason,
                widget.details,
                widget.level,
              );
            }
          }))
      ..setLooping(false)
      ..initialize().then((value) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget object;
    controller.value.isInitialized ? object = VideoPlayerWidget(controller: controller) : object = CircularProgressIndicator();
    return object;
  }
}
