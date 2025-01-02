import 'package:core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ContactDashboardEmptyWidget extends StatelessWidget {
  const ContactDashboardEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15),
        Text(
          "User Not Found",
          style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
