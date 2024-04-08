import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level20 extends StatefulWidget {
  const Level20({Key? key});

  @override
  State<Level20> createState() => _Level20State();
}

class _Level20State extends State<Level20> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_20_final.mp4',
              question: 'Who among the following should not be allowed inside the polling station?',
              crt_ans: 'Media persons accompanying the candidate or VIPs',
              option2: 'Media persons accompanying the candidate or VIPs',
              option1: 'Media persons authorized by the commission',
              option3: 'Staff of web casting team in case of a critical/sensitive polling station',
              reason: 'Restricted Access to Polling Station',
              details: 'Media persons accompanying the candidate or VIPs are not allowed inside the polling station, '
                  'ensuring the integrity and privacy of the voting process, as per electoral regulations',
              level: 20,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
