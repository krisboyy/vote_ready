import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vote_ready/pages/home_page.dart';

class TwoHourDialog extends StatefulWidget {
  static late Duration diff;

  static void showTwoHourDialog(BuildContext context, Duration dif) {
    diff = dif;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TwoHourDialog();
      },
    );
  }

  @override
  State<TwoHourDialog> createState() => _TwoHourDialogState();
}

class _TwoHourDialogState extends State<TwoHourDialog> {
  @override
  Widget build(BuildContext context) {
    TextStyle bodyStyle = GoogleFonts.poppins(
      fontSize: 8.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    var RemTime = TwoHourDialog.diff;

    return AlertDialog(
      content: SizedBox(
        height: 0.2.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "You can attempt the questions after waiting for two minutes",
              style: bodyStyle,
            ),
            Text(
              -RemTime.inMinutes >= 60 ? "Remaining time is ${-RemTime.inHours + 1} hours" : "Remaining time is ${-RemTime.inMinutes + 1} minutes",
              style: bodyStyle,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            child: Text(
              "OK",
              style: bodyStyle,
            ),
            onPressed: () {
              //exit(0);
              //
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                ModalRoute.withName("HomePage"),
              );
            },
          ),
        )
      ],
    );
  }
}
