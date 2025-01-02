import 'package:core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class BaseSnackbar {
  static SnackBar snackBar(BuildContext context, String message, {Function? onVisible}) {
    return SnackBar(
      content: Text(message),
      backgroundColor: context.theme.primaryColor,
      duration: const Duration(seconds: 3),
      onVisible: () {
        if (context.mounted) {
          Future.delayed(const Duration(seconds: 3), () {
            if (context.mounted) {
              onVisible?.call();
            }
          });
        }
      },
    );
  }
}
