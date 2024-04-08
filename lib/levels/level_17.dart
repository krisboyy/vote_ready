import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level17 extends StatefulWidget {
  const Level17({Key? key});

  @override
  State<Level17> createState() => _Level17State();
}

class _Level17State extends State<Level17> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_17_final.mp4',
              question: 'What is the order of EVM/VVPAT operation by the presiding officer at the end of mock poll?',
              crt_ans: 'Close-Result-Clear',
              option2: 'Close-Result-Close',
              option1: 'Close-Result-Clear',
              option3: 'Result-Clear-Close ',
              reason: 'EVM/VVPAT Operation Sequence at Mock Poll End',
              details: 'The correct order of EVM/VVPAT operation by the presiding officer at the end of the mock poll '
                  'is Close-Result-Clear, ensuring systematic shutdown and preparation for the actual polling process '
                  'in compliance with electoral procedures',
              level: 17,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
