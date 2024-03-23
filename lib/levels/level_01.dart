import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import 'package:vote_ready/constants.dart';

class Level01 extends StatefulWidget {
  const Level01({super.key});

  @override
  State<Level01> createState() => _Level01State();
}

class _Level01State extends State<Level01> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: AssetVideoPlayer(
      assets: [
        'assets/videos/scenario_1.mp4',
        'assets/videos/scenario_1_2.mp4'
      ],
    ));
  }
}
