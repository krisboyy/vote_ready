import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorPopUp extends StatelessWidget {
  const ErrorPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('Tips'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Some error occurred please try again',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                  FontWeight.w600
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
              Navigator.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}