import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level19 extends StatefulWidget {
  const Level19({Key? key});

  @override
  State<Level19> createState() => _Level19State();
}

class _Level19State extends State<Level19> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_19_final.mp4',
              question: 'Which of the following forms should be filled by the presiding officer to give the account of paper seals?',
              crt_ans: '17 C',
              option2: '17 B',
              option1: '17 A',
              option3: '17 C',
              reason: ' Form for Accounting Paper Seals',
              details: 'The presiding officer should fill Form 17C to account for paper seals, providing a comprehensive record in '
                  'accordance with electoral regulations and procedural requirements',
              level: 19,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
