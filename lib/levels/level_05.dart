import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level05 extends StatefulWidget {
  const Level05({Key? key});

  @override
  State<Level05> createState() => _Level05State();
}

class _Level05State extends State<Level05> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_5_final.mp4',
              question: 'Which among the following queue system at the polling station is correct?',
              crt_ans: 'Three separate queues (for men, women and one for person with disabilities and senior citizens )',
              wrg_ans1: 'Two separate queues (for men and women)',
              wrg_ans2: 'A single queue (for all men and women)',
              reason: 'Ensuring Efficient Queue Management at Polling Stations',
              details: 'Opting for three separate queues designated for men, women, and individuals with disabilities/senior '
                  'citizens streamlines the voting process, adhering to inclusivity principles and facilitating smoother '
                  'operations at the polling station, as per electoral guidelines.',
              level: 5,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
