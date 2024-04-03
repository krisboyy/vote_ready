import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_ready/pages/level_selector.dart';
import 'package:vote_ready/pages/login_page.dart';
import 'package:vote_ready/widgets/page_fonts.dart';
import '../components/timer_popup.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  static Future<String?> getLockData() async {
    String? retval = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey('unlockTime')) {
      retval = prefs.getString('unlockTime');
    }
    return retval;
  }

  @override
  Widget build(BuildContext context) {
    String? value;
    TextStyle headerStyle = GoogleFonts.fugazOne(
      fontWeight: FontWeight.bold,
      fontSize: 130.spMin,
    );

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
                    value = await getLockData();
                    if(null != value) {
                      final diff = DateTime.now().difference(DateTime.parse(value!));
                      if(diff <= Duration.zero){
                        TwoHourDialog.showTwoHourDialog(context,diff);
                      }else{
                        score = (await DataReader.getScoreSP('ScoreSP')) ?? 0;
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const LevelSelector()),
                          ),
                          ModalRoute.withName('/vote ready'),
                        );
                      }
                    }else{
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const LevelSelector()),
                        ),
                        ModalRoute.withName('/vote ready'),
                      );
                    }

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
  }
}
