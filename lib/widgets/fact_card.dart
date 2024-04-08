import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FactCard extends StatefulWidget {
  final int num;
  final String text;

  FactCard({
    required this.num,
    required this.text,
    super.key,
  });

  @override
  State<FactCard> createState() => _FactCardState();
}

class _FactCardState extends State<FactCard> {
  final Color materialColor = const Color(0xFFFFF1C3);

  final TextStyle boldStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 75.spMin,
  );

  final double borderRadius = 0.05.sh;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.2.sw,
      height: 0.2.sw,
      decoration: BoxDecoration(
        color: materialColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(0.02.sw),
      child: Column(
        children: [
          Text(
            widget.num.toString(),
            style: boldStyle.copyWith(height: 1),
          ),
          Text(
            widget.text,
            textAlign: TextAlign.center,
            style: boldStyle.copyWith(
              fontSize: 18.spMin,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
