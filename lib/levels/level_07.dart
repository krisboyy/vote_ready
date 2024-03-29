import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';

class Level07 extends StatefulWidget {
  const Level07({super.key});

  @override
  State<Level07> createState() => _Level07State();
}

class _Level07State extends State<Level07> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: AssetVideoPlayer(
            asset: 'assets/videos/scenario_7_final.mp4',
            question: '',
            crt_ans: '',
            wrg_ans1: '',
            wrg_ans2: '',
            reason: '',
            details: '',
            level: 7,
          ),
        ));
  }
}
