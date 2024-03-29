import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';

class Level01 extends StatefulWidget {
  const Level01({super.key});

  @override
  State<Level01> createState() => _Level01State();
}

class _Level01State extends State<Level01> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: AssetVideoPlayer(
        asset: 'assets/videos/scenario_1_final.mp4',
        question: 'The voter complaints that the print from VVPAT is wrong',
        crt_ans: 'Perform Test Vote',
        wrg_ans1: 'Ignore him',
        wrg_ans2: 'Stop polling',
        reason: '',
        details: '',
        level: 1,

      ),
    ));
  }
}
