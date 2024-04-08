import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level14 extends StatefulWidget {
  const Level14({Key? key});

  @override
  State<Level14> createState() => _Level14State();
}

class _Level14State extends State<Level14> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_14_final.mp4',
              question: "If the ballot unit or the control unit doesn''t function properly in course of the actual poll, which of the following should be replaced?",
              crt_ans: 'Control unit, ballot unit and VVPAT',
              option2: 'Control unit and VVPAT only',
              option1: 'Control unit and ballot unit only',
              option3: 'Control unit, ballot unit and VVPAT',
              reason: 'Replacement Procedure for Malfunctioning Units',
              details: 'In the event of malfunctioning units during the actual poll, both the control unit, '
                  'the ballot unit, and the VVPAT should be replaced, ensuring the integrity and continuity of '
                  'the voting process as per electoral protocols',
              level: 14,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
