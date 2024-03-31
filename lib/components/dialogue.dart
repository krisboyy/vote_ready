import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DialogueWidget extends StatelessWidget {
  final String playerName;
  final String dialogueText;
  final String playerIconPath; // Path to your player icon image

  const DialogueWidget({
    super.key,
    required this.playerName,
    required this.dialogueText,
    required this.playerIconPath,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle = TextStyle(fontSize: 24.0.spMin
        // fontFamily: 'Fugaz One',
        );
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
            width: 17.spMin,
            height: 12.spMin,
            padding: EdgeInsets.all(12.0.spMin),
            decoration: BoxDecoration(
              color: Color(0xFFF8EFAC), // Customize the background color
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playerName,
                  style: headerStyle.copyWith(
                    fontSize: 10.spMax,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  dialogueText,
                  style: headerStyle.copyWith(
                    fontSize: 10.0.spMin,
                    color: Color(0xFFA4303F),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Next",
                        style: headerStyle.copyWith(
                          fontSize: 10.0.spMin,
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
