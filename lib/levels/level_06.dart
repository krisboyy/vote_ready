import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';

class Level06 extends StatefulWidget {
  const Level06({super.key});

  @override
  State<Level06> createState() => _Level06State();
}

class _Level06State extends State<Level06> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: AssetVideoPlayer(
            asset: 'assets/videos/scenario_6_final.mp4',
            question: 'Photography / videography is allowed ',
            crt_ans: 'Only outside the polling station',
            wrg_ans1: 'Both outside and inside the polling station except the voting compartment',
            wrg_ans2: 'Anywhere',
            reason: 'Guidelines for Photography/Videography at Polling Stations',
            details: ' Photography/videography is permitted only outside the polling station, '
                'maintaining the sanctity of the voting process while ensuring transparency and '
                'compliance with electoral regulations',
            level: 6,
          ),
        ));
  }
}
