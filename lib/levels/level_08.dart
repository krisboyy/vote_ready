import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';

class Level08 extends StatefulWidget {
  const Level08({super.key});

  @override
  State<Level08> createState() => _Level08State();
}

class _Level08State extends State<Level08> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: AssetVideoPlayer(
            asset: 'assets/videos/scenario_8_final.mp4',
            question: '',
            crt_ans: '',
            wrg_ans1: '',
            wrg_ans2: '',
            reason: '',
            details: '',
            level: 8,
          ),
        ));
  }
}
