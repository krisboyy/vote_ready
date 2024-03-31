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
              question: 'A person claims that he/she is blind and needs a companion to vote',
              crt_ans: 'The presiding officer permits a same-constituency citizen'
                  'to assist the voter after collecting required affidavits',
              wrg_ans1: 'The presiding officer casts vote on his / her behalf or allows a '
                  'polling agent to cast a vote on his/her behalf',
              wrg_ans2: 'The presiding officer asks a child to cast vote on his behalf',
              reason: 'Ensuring Accessibility for Voters with Disabilities',
              details: 'By allowing a same-constituency citizen to provide assistance upon '
                  'collecting necessary affidavits, the presiding officer ensures that individuals '
                  'with disabilities, such as blindness, can exercise their voting rights effectively '
                  'and independently, aligning with electoral guidelines',
              level: 7,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
