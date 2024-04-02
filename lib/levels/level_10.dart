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
              question: 'A voter refuses to vote as soon as he reaches the polling compartment',
              crt_ans: 'Make a remark in 17A register that the voter refused to vote and allow him/her to leave',
              option1: 'Force the voter to cast the vote',
              option2: 'Hand over the voter to the police',
              option3: 'Make a remark in 17A register that the voter refused to vote and allow him/her to leave',
              reason: 'Handling Voter Refusal at Polling Compartment',
              details: 'As per Rule 49 O of the Conduct Of Election Rules,1961, when a voter declines to vote upon reaching the polling compartment, the appropriate procedure '
                  'is to allow the voter to leave while documenting the refusal in the remarks column of the register, '
                  'ensuring transparency and accuracy in the electoral process.',
              level: 10,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
