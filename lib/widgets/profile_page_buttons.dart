import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vote_ready/pages/credits_page.dart';
import 'package:vote_ready/pages/login_page.dart';

class ProfilePageButton extends StatelessWidget {
  final String text;
  final AssetImage icon;
  final String navigateTo;
  final Color materialColor = const Color(0xFFFFF1C3);
  final TextStyle boldStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 90.spMin,
  );
  final double borderRadius = 0.05.sh;

  ProfilePageButton({
    required this.text,
    required this.icon,
    required this.navigateTo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.3.sw,
      height: 0.08.sw,
      decoration: BoxDecoration(
        color: materialColor,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              offset: Offset.fromDirection(
                1.1,
                7,
              ))
        ],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            switch (navigateTo) {
              case 'Credits':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreditsPage(),
                  ),
                );
                break;
              case 'Logout':
                await AuthService.logout();
                if (context.mounted) {
                  Navigator.pop(context);
                }
                break;
              default:
            }
          },
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: Theme.of(context).splashColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 0.2.sw,
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: boldStyle.copyWith(fontSize: 20.spMin),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 0.05.sw,
                height: 0.05.sw,
                padding: EdgeInsets.all(0.05.sw),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: icon,
                    scale: 0.5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
