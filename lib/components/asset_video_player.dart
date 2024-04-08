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
  const AssetVideoPlayer({
    required this.asset,
    super.key,
    required this.question,
    required this.crt_ans,
    required this.reason,
    required this.details,
    required this.level,
    required this.option1,
    required this.option2,
    required this.option3,
  });

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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return QuestionPopup(
                    crt_ans: widget.crt_ans,
                    question: widget.question,
                    option1: widget.option1,
                    option2: widget.option2,
                    option3: widget.option3,
                    reason: widget.reason,
                    details: widget.details,
                    level: widget.level, // level value
                  );
                },
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
