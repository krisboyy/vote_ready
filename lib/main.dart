import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:vote_ready/constants.dart';
import 'package:vote_ready/pages/home_page.dart';

import 'components/dialogue.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscape();
  Flame.device.fullScreen();
  runApp(const VoteReadyGame());
}

class VoteReadyGame extends StatelessWidget {
  const VoteReadyGame({super.key});

  @override
  Widget build(BuildContext context) {
    const Constants().build(context);
    return const MaterialApp(
      // home: HomePage(),
      home: DialogueWidget(
        playerName: "Press Agent",
        dialogueText: "Hello, Can I come inside and shoot some visuals?",
        playerIconPath: 'assets/images/press.png',
      ),
    );
  }
}
