import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level18 extends StatefulWidget {
  const Level18({Key? key});

  @override
  State<Level18> createState() => _Level18State();
}

class _Level18State extends State<Level18> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_18_final.mp4',
              question: 'Which button of the control unit should be pressed after the completion of actual poll?',
              crt_ans: 'Close',
              option2: 'Result',
              option1: 'Clear',
              option3: 'Close',
              reason: 'Control Unit Button After Actual Poll',
              details: 'After the completion of the actual poll, the presiding officer should press the "Close" button on '
                  'the control unit, initiating the closing process and ensuring the proper conclusion of the voting process '
                  'in accordance with electoral procedures',
              level: 18,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
