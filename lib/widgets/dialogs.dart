import 'package:flutter/material.dart';

Future<bool?> showMessageDialog({
  required BuildContext context,
  required String message,
}) {
  return showDialog<bool?>(
    context: context,
    builder: (_) => MessageDialog(message: message),
  );
}

class DialogCard extends StatelessWidget {
  const DialogCard({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.75,
          margin: MediaQuery.viewInsetsOf(context),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
            boxShadow: const [
              BoxShadow(offset: Offset(4, 4)),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        ),
      ),
    );
  }
}

class NoteButton extends StatelessWidget {
  const NoteButton({
    super.key,
    required this.child,
    this.onPressed,
    this.isOutlined = false,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: isOutlined ? Theme.of(context).primaryColor : Colors.black,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.white : Theme.of(context).primaryColor,
          foregroundColor: isOutlined ? Theme.of(context).primaryColor : Colors.white,
          disabledBackgroundColor: Colors.black,
          disabledForegroundColor: Colors.black,
          side: BorderSide(color: isOutlined ? Theme.of(context).primaryColor : Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: child,
      ),
    );
  }
}

class MessageDialog extends StatelessWidget {
  const MessageDialog({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return DialogCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NoteButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
