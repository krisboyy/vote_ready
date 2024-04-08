import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vote_ready/pages/credits_page.dart';
import 'package:vote_ready/pages/login_page.dart';
import 'package:vote_ready/widgets/fact_card.dart';
import 'package:vote_ready/widgets/profile_page_buttons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void goToCredits(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreditsPage(),
      ),
    );
  }

  void logout() async {
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    Color materialColor = const Color(0xFFFFF1C3);
    double borderRadius = 0.05.sh;
    TextStyle boldStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 50.spMin,
    );
    TextStyle normalStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: 18.spMin,
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1.sh),
        child: AppBar(
          clipBehavior: Clip.none,
          primary: true,
          title: null,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              // margin: EdgeInsets.only(
              //   right: 0.025.sw,
              //   top: 0.075.sh,
              // ),
              child: IconButton.filledTonal(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary),
                    fixedSize: MaterialStatePropertyAll(
                      Size(
                        0.025.sw,
                        0.025.sw,
                      ),
                    ),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                          0.01.sw,
                        )),
                      ),
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close_rounded),
              ),
            ),
            SizedBox(
              width: 0.025.sw,
            )
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: 1.sw,
            height: 0.4.sh,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 0.3.sh,
                  height: 0.3.sh,
                  margin: EdgeInsets.only(
                    left: 0.03.sw,
                    right: 0.03.sw,
                    top: 0.03.sw,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        AuthService.user!.photoURL!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 0.5.sw,
                  height: 0.3.sh,
                  margin: EdgeInsets.only(top: 0.03.sw),
                  // color: Colors.greenAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AuthService.user!.displayName!,
                        style: boldStyle,
                      ),
                      Text(
                        AuthService.user!.email!,
                        style: normalStyle,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1.sw,
            height: 0.6.sh,
            // color: Colors.amberAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 0.1.sw,
                  height: 0.6.sh,
                  // color: Colors.blueAccent,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: materialColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(borderRadius),
                      bottomRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.01.sw,
                  ),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "Key Facts",
                      textAlign: TextAlign.center,
                      style: boldStyle.copyWith(fontSize: 30),
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                ),
                Container(
                  width: 0.45.sw,
                  height: 0.6.sw,
                  // color: Colors.amberAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FactCard(
                        num: 5,
                        text: "Levels Completed",
                      ),
                      FactCard(
                        num: 5,
                        text: "Levels Remaining",
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 0.5.sh,
                      width: 0.004.sw,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(0.5.sw),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfilePageButton(
                          text: "Development Credits",
                          icon: "rit.png",
                          navigateTo: 'Credits',
                        ),
                        ProfilePageButton(
                          text: "Logout",
                          icon: "logout.png",
                          navigateTo: 'Logout',
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
