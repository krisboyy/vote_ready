import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<bool?> showMessageDialog({
  required BuildContext context,
  required String message,
}) {
  return showDialog<bool?>(
    context: context,
    builder: (_) => Container(
      width: 0.4.sw,
      height: 0.4.sh,
      child: Column(
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    ),
  );
}
