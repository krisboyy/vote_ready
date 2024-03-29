import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';

class Level05 extends StatefulWidget {
  const Level05({super.key});

  @override
  State<Level05> createState() => _Level05State();
}

class _Level05State extends State<Level05> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: AssetVideoPlayer(
            asset: 'assets/videos/scenario_5_final.mp4',
            question: 'Which among the following queue system at the polling station is correct?',
            crt_ans: 'Three separate queues (for men, women and one for person with disabilities and senior citizens )',
            wrg_ans1: 'Two separate queues (for men and women)',
            wrg_ans2: 'A single queue (for all men and women)',
            reason: '',
            details: '',
            level: 5,
          ),
        ));
  }
}
