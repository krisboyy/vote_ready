import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';

class Level10 extends StatefulWidget {
  const Level10({super.key});

  @override
  State<Level10> createState() => _Level10State();
}

class _Level10State extends State<Level10> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: AssetVideoPlayer(
            asset: 'assets/videos/scenario_10_final.mp4',
            question: '',
            crt_ans: '',
            wrg_ans1: '',
            wrg_ans2: '',
            reason: '',
            details: '',
            level: 10,
          ),
        ));
  }
}
