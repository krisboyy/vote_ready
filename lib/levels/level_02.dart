import 'package:flutter/material.dart';
import 'package:vote_ready/components/asset_video_player.dart';
import '../widgets/custom_button.dart';

class Level02 extends StatefulWidget {
  const Level02({Key? key});

  @override
  State<Level02> createState() => _Level02State();
}

class _Level02State extends State<Level02> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: AssetVideoPlayer(
              asset: 'assets/videos/scenario_2_final.mp4',
              question: 'Polling agents challenge the identity of a voter, alleging that he is not the correct voter',
              option1: 'Collect 2 rupees from the polling agent. The presiding officer conducts an inquiry and permits '
                  'voting if challenge unproven; otherwise, hand over to police',
              option3: 'Presiding officer directly debar the voter from voting',
              option2: 'Collect 2 rupees from the polling agent. Presiding officer conducts an enquiry and if the '
                  'challenge is established, allow the voter to cast vote',
              crt_ans: 'Collect 2 rupees from the polling agent. The presiding officer conducts an inquiry and permits '
                  'voting if challenge unproven; otherwise, hand over to police',
              reason: 'Ensuring Voter Identity Integrity',
              details: 'The presiding officer collects 2 rupees from the polling agent and conducts an enquiry; '
                  'if the challenge is not established, the voter is allowed to cast their vote, but if validated, '
                  'the voter is debarred from voting, and will be hand over to the police ensuring the integrity of '
                  'the electoral process.',
              level: 2,
            ),
          ),
          CustomFAB(), // Add your custom FAB here
        ],
      ),
    );
  }
}
