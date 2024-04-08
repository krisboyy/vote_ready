import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level12 extends StatefulWidget {
  const Level12({Key? key});

  @override
  State<Level12> createState() => _Level12State();
}

class _Level12State extends State<Level12> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_12_final.mp4',
              question: 'As the Presiding Officer, when should I remove the slips from the VVPAT?',
              crt_ans: 'After mock poll',
              option2: 'After the end of the polling',
              option1: 'They should not be removed at all',
              option3: 'After mock poll',
              reason: 'Removal of Slips from VVPAT',
              details: 'Slips from the VVPAT should be removed after the mock poll, ensuring readiness for the actual polling '
                  'process and compliance with procedural requirements',
              level: 12,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
