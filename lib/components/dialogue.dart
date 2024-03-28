import 'package:flutter/material.dart';
import 'package:vote_ready/constants.dart';

class DialogueWidget extends StatelessWidget {
  final String playerName;
  final String dialogueText;
  final String playerIconPath; // Path to your player icon image

  const DialogueWidget({
    Key? key,
    required this.playerName,
    required this.dialogueText,
    required this.playerIconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // // Player Icon
          // CircleAvatar(
          //   backgroundImage: AssetImage(playerIconPath),
          //   radius: 25.0, // Adjust the radius as needed
          // ),
          // const SizedBox(width: 16.0),
          // // Dialogue Text Container
          Container(
            width: 0.7 * Constants.screenWidth,
            height: 0.2 * Constants.screenHeight,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Color(0xFFF8EFAC), // Customize the background color
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playerName,
                  style: Constants.headerStyle.copyWith(
                    fontSize: Constants.smallFontSize * 0.5,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  dialogueText,
                  style: Constants.headerStyle.copyWith(
                    fontSize: Constants.smallFontSize * 0.25,
                    color: Color(0xFFA4303F),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Next",
                        style: Constants.headerStyle.copyWith(
                          fontSize: 0.25 * Constants.smallFontSize,
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
