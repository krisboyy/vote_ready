import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vote_ready/pages/level_selector.dart';
import 'package:vote_ready/pages/login_page.dart';
import 'package:vote_ready/widgets/page_fonts.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle = GoogleFonts.fugazOne(
      fontWeight: FontWeight.bold,
      fontSize: 130.spMin,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF2F3ED),
      body: Center(
        // child: SingleChildScrollView(
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
            Positioned(
              top: 10.spMax,
              right: 10.spMax,
              child: Container(
                width: 20.spMax,
                height: 20.spMax,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(AuthService.user!.photoURL!),
                    )),
                clipBehavior: Clip.none,
                child: IconButton(
                  onPressed: () {},
                  icon: SizedBox(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}
