import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildVideo(),
          if (!controller.value.isInitialized) ...[
            const CircularProgressIndicator(), // Show loading indicator
          ],
          if (controller.value.hasError) ...[
            const Text(
              'Error loading video', // Show error message
              style: TextStyle(color: Colors.red),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildVideo() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
