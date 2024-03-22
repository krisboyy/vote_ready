import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vote_ready/constants.dart';

class Level01 extends StatefulWidget {
  const Level01({super.key});

  @override
  State<Level01> createState() => _Level01State();
}

class _Level01State extends State<Level01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Image.asset(
            'assets/images/voter.png',
            height: 0.7 * Constants.screenHeight,
          ).animate(effects: [
            MoveEffect(
              duration: const Duration(milliseconds: 500),
              begin: Offset.fromDirection(360, 150),
            )
          ]),
        ],
      ),
    );
  }
}
