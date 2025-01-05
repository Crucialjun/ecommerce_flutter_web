import 'package:flutter/material.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog(
      {super.key,
      this.title = "Are you sure?",
      this.content = "Are you sure you want to delete this item?",
      this.confirmButtonText = "Yes",
      this.cancelButtonText = "No",
      this.onConfirm,
      this.onCancel});

  final String title;
  final String content;
  final String confirmButtonText;
  final String cancelButtonText;
  final Function()? onConfirm;
  final Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (onCancel != null) {
              onCancel!();
            }
            Navigator.of(context).pop();
          },
          child: Text(cancelButtonText),
        ),
        TextButton(
          onPressed: () {
            if (onConfirm != null) {
              onConfirm!();
            }
          },
          child: Text(confirmButtonText),
        ),
      ],
    );
  }
}
