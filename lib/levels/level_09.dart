import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level09 extends StatefulWidget {
  const Level09({Key? key});

  @override
  State<Level09> createState() => _Level09State();
}

class _Level09State extends State<Level09> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_9_final.mp4',
              question: 'What is the minimum number of votes to be cast during the mock poll?',
              crt_ans: '50',
              option1: '100',
              option3: '10',
              option2: '50',
              reason: 'Minimum Votes Required for Mock Poll',
              details: 'The minimum number of votes to be casted during a mock poll is 50, ensuring '
                  'comprehensive testing of the electronic voting machines (EVMs) and the Voter Verifiable '
                  'Paper Audit Trail (VVPAT) system, in line with electoral procedures and standards',
              level: 9,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
