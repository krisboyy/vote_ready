import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level16 extends StatefulWidget {
  const Level16({Key? key});

  @override
  State<Level16> createState() => _Level16State();
}

class _Level16State extends State<Level16> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_16_final.mp4',
              question: 'Among the following uniformed personals, who can enter the pooling booth?',
              crt_ans: 'None',
              option2: 'Any policeman directed for the law-and-order maintenance of polling',
              option1: 'Any officer above the rank of superintendent police',
              option3: 'None',
              reason: 'Access to Polling Booth for Uniformed Personnel',
              details: 'No uniformed personnel are permitted to enter the polling booth, ensuring the '
                  'integrity and privacy of the voting process in accordance with electoral regulations',
              level: 16,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
