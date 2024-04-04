import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageButton extends StatelessWidget {
  final String icon;
  final String text;
  final Color materialColor = const Color(0xFFFFF1C3);
  final TextStyle boldStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 90.spMin,
  );
  final double borderRadius = 0.05.sh;

  ProfilePageButton({
    required this.text,
    required this.icon,
    required super.key,
  });

  @override
  Widget build(BuildContext context) {
    String temp = 'assets/images/$icon';
    return Scaffold(
      body: Container(
        width: 0.3.sw,
        height: 0.1.sw,
        decoration: BoxDecoration(
          color: materialColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
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
              width: 0.1.sw,
              height: 0.1.sw,
              padding: EdgeInsets.all(0.01.sw),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    temp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
