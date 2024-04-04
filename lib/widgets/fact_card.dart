import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FactCard extends StatelessWidget {
  final int num;
  final String text;
  final Color materialColor = const Color(0xFFFFF1C3);
  final TextStyle boldStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 90.spMin,
  );
  final double borderRadius = 0.05.sh;

  FactCard({
    required this.num,
    required this.text,
    required super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 0.2.sw,
        height: 0.2.sw,
        decoration: BoxDecoration(
          color: materialColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            Text(
              num.toString(),
              style: boldStyle.copyWith(height: 1),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: boldStyle.copyWith(
                fontSize: 20.spMin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
