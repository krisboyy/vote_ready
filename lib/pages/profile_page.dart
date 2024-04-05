import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vote_ready/pages/login_page.dart';
import 'package:vote_ready/widgets/fact_card.dart';
import 'package:vote_ready/widgets/profile_page_buttons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                const Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    right: 0.025.sw,
                    top: 0.075.sh,
                  ),
                  child: IconButton.filledTonal(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary),
                      fixedSize: MaterialStatePropertyAll(
                        Size(
                          0.05.sw,
                          0.05.sw,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close_rounded),
                  ),
                )
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
                        key: key,
                      ),
                      FactCard(
                        num: 5,
                        text: "Levels Remaining",
                        key: key,
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
                          key: key,
                        ),
                        ProfilePageButton(
                          text: "Logout",
                          icon: "logout.png",
                          key: key,
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
