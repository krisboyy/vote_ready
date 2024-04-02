import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level06 extends StatefulWidget {
  const Level06({Key? key});

  @override
  State<Level06> createState() => _Level06State();
}

class _Level06State extends State<Level06> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_6_final.mp4',
              question: 'Photography / videography is allowed ',
              crt_ans: 'Only outside the polling station',
              option1: 'Both outside and inside the polling station except the voting compartment',
              option3: 'Anywhere',
              option2: 'Only outside the polling station',
              reason: 'Guidelines for Photography/Videography at Polling Stations',
              details: ' Photography/videography is permitted only outside the polling station, '
                  'maintaining the sanctity of the voting process while ensuring transparency and '
                  'compliance with electoral regulations',
              level: 6,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
