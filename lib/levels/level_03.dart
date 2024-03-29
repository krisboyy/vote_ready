import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';

class Level03 extends StatefulWidget {
  const Level03({super.key});

  @override
  State<Level03> createState() => _Level03State();
}

class _Level03State extends State<Level03> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: AssetVideoPlayer(
            asset: 'assets/videos/scenario_3_final.mp4',
            question: 'A voter finds that another person has already casted his vote',
            crt_ans: 'Allow the voter to cast vote in tendered ballot paper',
            wrg_ans1: 'Allow the voter to cast vote',
            wrg_ans2: 'Hand over the voter to police',
            reason: '',
            details: '',
            level: 3,
          ),
        ));
  }
}
