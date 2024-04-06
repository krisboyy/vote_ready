import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vote_ready/pages/home_page.dart';

class TwoHourDialog extends StatefulWidget {

  static late Duration diff;

  static void showTwoHourDialog(BuildContext context,Duration dif) {
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
    var RemTime = TwoHourDialog.diff;

    return AlertDialog(
      content:
      Container(
        height: 0.2.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You can attempt the questions after waiting for two hours",
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            Text(-RemTime.inMinutes>=60? "Remaining time is ${-RemTime.inHours+1} hours" : "Remaining time is ${-RemTime.inMinutes+1} minutes" ,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),

      actions: <Widget>[
        Center(
          child: ElevatedButton(
          child: Text("OK",
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            //exit(0);
            //
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: ((context) => const HomePage()),
              ),
              ModalRoute.withName('/vote ready'),
            );
          },
        ),
        )
      ],
    );
  }
}


