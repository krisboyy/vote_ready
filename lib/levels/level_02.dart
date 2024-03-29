import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';

class Level02 extends StatefulWidget {
  const Level02({super.key});

  @override
  State<Level02> createState() => _Level02State();
}

class _Level02State extends State<Level02> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: AssetVideoPlayer(
            asset: 'assets/videos/scenario_2_final.mp4',
            question: 'Polling agents challenge the identity of a voter, alleging that he is not the correct voter',
            crt_ans: 'Collect 2 rupees from the polling agent. Presiding officer conducts an enquiry '
                'and allows the voter to cast vote if the challenge is not established and if the challenge'
                ' is established, debar the voter from voting',
            wrg_ans1: 'Presiding officer directly debar the voter from voting',
            wrg_ans2: 'Collect 2 rupees from the polling agent. Presiding officer conducts an enquiry and if the '
                'challenge is established, allow the voter to cast vote',
            reason: '',
            details: '',
            level: 2,
          ),
        ));
  }
}
