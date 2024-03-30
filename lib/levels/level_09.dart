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
            question: 'The minimum number of votes to be casted during mock poll is',
            crt_ans: '50',
            wrg_ans1: '100',
            wrg_ans2: '10',
            reason: 'Minimum Votes Required for Mock Poll',
            details: 'The minimum number of votes to be casted during a mock poll is 50, ensuring '
                'comprehensive testing of the electronic voting machines (EVMs) and the Voter Verifiable '
                'Paper Audit Trail (VVPAT) system, in line with electoral procedures and standards',
            level: 9,
          ),
        ));
  }
}
