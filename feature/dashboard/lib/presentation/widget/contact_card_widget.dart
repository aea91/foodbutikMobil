import 'package:core/extensions/context_extensions.dart';
import 'package:dashboard/domain/entity/user_response_entity.dart';
import 'package:flutter/material.dart';

import 'package:uikit/card/base_contact_card.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({super.key, required this.user});

  final UserResponseEntity user;

  @override
  Widget build(BuildContext context) {
    return BaseContactCard(
      onTap: () async {},
      name: user.name ?? "",
      phone: user.phone ?? "",
      theme: context.theme,
    );
  }
}
