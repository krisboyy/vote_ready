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
              question: 'As the Presiding Officer, what should I do if a Polling Agent brings a mobile phone to the polling booth?',
              crt_ans: 'Polling Agent should not bring a mobile phone. If brought, it should be switched off and handed over to the Presiding Officer',
              option1: 'Polling Agent should not bring a mobile phone. If brought, it should be switched off and handed over to the Presiding Officer',
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
