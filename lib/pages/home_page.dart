import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vote_ready/pages/level_selector.dart';
import 'package:vote_ready/widgets/stroke_font.dart';

import '../widgets/custom_button.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     TextStyle headerStyle = TextStyle(fontSize: 130.0.spMin
//         // fontFamily: 'Fugaz One',
//         );
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F3ED),
//       body: Center(
//         child: Stack(
//           clipBehavior: Clip.none,
//           alignment: Alignment.center,
//           children: [
//             Expanded(
//               child: Transform.scale(
//                 scale: 1.1,
//                 child: Image.asset(
//                   'assets/images/bg_image.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Stack(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Stack(
//                       clipBehavior: Clip.none,
//                       alignment: Alignment.center,
//                       children: [
//                         StrokeFont(
//                           text: 'Vote',
//                           headerStyle: headerStyle,
//                           fontColor: const Color(0xFFFF9933),
//                         ),
//                         Positioned(
//                           top: 35.spMax,
//                           child: StrokeFont(
//                             text: 'Ready',
//                             headerStyle: headerStyle,
//                             fontColor: const Color(0xFF128807),
//                           ),
//                         ),
//                       ],
//                     ),
//                     CustomButton(
//                         onPressed: () async {
//                           await Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: ((context) => const LevelSelector()),
//                             ),
//                           );
//                         },
//                         buttonSize: 15,
//                         backgroundColor: const Color(0xFF128807),
//                         fontColor: Colors.white,
//                         strokeColor: const Color(0xFFFF9933),
//                         text: 'Start',
//                         headerStyle: headerStyle),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle = TextStyle(fontSize: 130.0.spMin);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F3ED),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: 1.1,
              child: Image.asset(
                'assets/images/bg_image.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    StrokeFont(
                      text: 'Vote',
                      headerStyle: headerStyle,
                      fontColor: const Color(0xFFFF9933),
                    ),
                    Positioned(
                      top: 35.spMax,
                      child: StrokeFont(
                        text: 'Ready',
                        headerStyle: headerStyle,
                        fontColor: const Color(0xFF128807),
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const LevelSelector()),
                      ),
                    );
                  },
                  buttonSize: 15,
                  backgroundColor: const Color(0xFF128807),
                  fontColor: Colors.white,
                  strokeColor: const Color(0xFFFF9933),
                  text: 'Start',
                  headerStyle: headerStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
