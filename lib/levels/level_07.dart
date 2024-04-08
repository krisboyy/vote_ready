import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level07 extends StatefulWidget {
  const Level07({Key? key});

  @override
  State<Level07> createState() => _Level07State();
}

class _Level07State extends State<Level07> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_7_final.mp4',
              question: 'I am a visually impaired individual and I require a companion to assist me in exercising my voting rights',
              crt_ans: 'The presiding officer permits a same-constituency citizen'
                  ' to assist the voter after collecting required affidavits',
              option1: 'The presiding officer casts vote on his / her behalf or allows a '
                  'polling agent to cast a vote on his/her behalf',
              option2: 'The presiding officer asks a child to cast vote on his behalf',
              option3: 'The presiding officer permits a same-constituency citizen'
                  ' to assist the voter after collecting required affidavits',
              reason: 'Ensuring Accessibility for Voters with Disabilities',
              details: 'Rule 49N of the Conduct of Election Rules, 1961 allows same-constituency citizens to assist '
                  'individuals with disabilities, such as blindness, in exercising their voting rights independently, '
                  'in accordance with electoral guidelines.',
              level: 7,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
