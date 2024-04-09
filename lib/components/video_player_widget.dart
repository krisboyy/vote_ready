import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../pages/home_page.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    controller.value.isInitialized;
    return WillPopScope(
        onWillPop: () async {
      // Navigate to the home page when the back button is pressed
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      return true; // Return true to prevent the default back button behavior
    },
    child:AspectRatio(
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
    ),
    );
  }

  Widget buildVideo() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
