import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level11 extends StatefulWidget {
  const Level11({Key? key});

  @override
  State<Level11> createState() => _Level11State();
}

class _Level11State extends State<Level11> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_11_final.mp4',
              question: 'When can the VVPAT be connected to the Ballot Unit',
              crt_ans: 'Just before mock poll',
              option2: 'Just before mock poll',
              option1: 'At distribution / collection center',
              option3: 'Any time after reaching polling booth',
              reason: 'Connecting VVPAT to Ballot Unit',
              details: 'The VVPAT can be connected to the Ballot Unit just before the mock poll, ensuring readiness for '
                  'testing and compliance with procedural guidelines',
              level: 11,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
