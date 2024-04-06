import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level15 extends StatefulWidget {
  const Level15({Key? key});

  @override
  State<Level15> createState() => _Level15State();
}

class _Level15State extends State<Level15> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_15_final.mp4',
              question: 'The order of seating of polling agents in the booth is',
              crt_ans: 'In the order of their candidates in the ballot paper ',
              option2: 'In the order of their candidates in the ballot paper ',
              option1: 'In the alphabetical order of their names',
              option3: 'Any order',
              reason: 'Seating Arrangement for Polling Agents',
              details: 'Polling agents should be seated in the booth in the order of their candidates in the ballot '
                  'paper, ensuring clarity and adherence to electoral procedures during the voting process',
              level: 15,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
