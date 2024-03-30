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
            question: 'The custodian of the marked copy of electoral roll is',
            crt_ans: 'First Polling officer ',
            wrg_ans1: 'Presiding officer',
            wrg_ans2: 'Second Polling officer',
            reason: 'Custody of Marked Copy of Electoral Roll',
            details: 'The first polling officer is responsible for the custody of the marked copy of the '
                'electoral roll, ensuring the integrity and security of voter records throughout the '
                'polling process, as mandated by electoral regulations',
            level: 8,
          ),
        ));
  }
}
