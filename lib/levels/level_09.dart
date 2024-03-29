import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';

class Level09 extends StatefulWidget {
  const Level09({super.key});

  @override
  State<Level09> createState() => _Level09State();
}

class _Level09State extends State<Level09> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: AssetVideoPlayer(
            asset: 'assets/videos/scenario_9_final.mp4',
            question: '',
            crt_ans: '',
            wrg_ans1: '',
            wrg_ans2: '',
            reason: '',
            details: '',
            level: 9,
          ),
        ));
  }
}
