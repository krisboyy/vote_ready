import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level10 extends StatefulWidget {
  const Level10({Key? key});

  @override
  State<Level10> createState() => _Level10State();
}

class _Level10State extends State<Level10> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_10_final.mp4',
              question: 'The second and third polling officers should '
                  'remain with the presiding officer and the first polling officer till',
              crt_ans: 'The materials and forms are returned at the collection center ',
              wrg_ans1: 'The end of voting',
              wrg_ans2: 'The materials and forms are packed',
              reason: 'Responsibilities of Polling Officers',
              details: 'The second and third polling officers should stay with the presiding '
                  'officer and the first polling officer until the materials and forms are '
                  'returned at the collection center, ensuring accountability and adherence to '
                  'procedural requirements in accordance with election protocols',
              level: 10,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
