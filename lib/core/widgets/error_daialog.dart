import 'package:chat_app/core/helpers/extentions.dart';
import 'package:flutter/material.dart';

import '../themes/text_style.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.content, required this.context});
  final String content;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        content,
        style: TextStyles.font15DarkBlueMediun,
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Got It",
              style: TextStyles.font14BlueSemiBold,
            ))
      ],
    );
  }
}
