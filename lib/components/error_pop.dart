import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPopUp extends StatelessWidget {
  const ErrorPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle bodyStyle = GoogleFonts.poppins(
      fontSize: 8.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    return AlertDialog(
      // title: const Text('Tips'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Some error occurred please try again',
              style: bodyStyle,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            child: Text("OK",
              style: bodyStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}