import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level08 extends StatefulWidget {
  const Level08({Key? key});

  @override
  State<Level08> createState() => _Level08State();
}

class _Level08State extends State<Level08> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_8_final.mp4',
              question: 'Who is the custodian of the marked copy of the electoral roll?',
              crt_ans: 'First Polling officer ',
              option1: 'Presiding officer',
              option2: 'Second Polling officer',
              option3: 'First Polling officer ',
              reason: 'Custody of Marked Copy of Electoral Roll',
              details: 'The first polling officer is responsible for the custody of the marked copy of the '
                  'electoral roll, ensuring the integrity and security of voter records throughout the '
                  'polling process, as mandated by electoral regulations',
              level: 8,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
