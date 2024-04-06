import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level13 extends StatefulWidget {
  const Level13({Key? key});

  @override
  State<Level13> createState() => _Level13State();
}

class _Level13State extends State<Level13> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_13_final.mp4',
              question: 'As a presiding officer, what should I do if an polling agent brings mobile phones to the polling booth?',
              crt_ans: 'Polling agent shall not bring mobile phone. If brought , it should be switched off and handover to presiding officer',
              option1: 'Polling agent shall not bring mobile phone. If brought , it should be switched off and handover to presiding officer',
              option2: 'Report the incident to the police',
              option3: 'Do nothing',
              reason: 'Handling Polling Agents Bringing Mobile Phones',
              details: 'If a polling agent brings a mobile phone to the polling booth, they should switch it off and '
                  'hand it over to the presiding officer, ensuring compliance with electoral regulations and maintaining '
                  'the integrity of the voting process',
              level: 13,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
