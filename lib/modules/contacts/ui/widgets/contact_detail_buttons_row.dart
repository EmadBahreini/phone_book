import 'package:flutter/material.dart';
import 'package:phone_book/common/style/colorPalette/color_palette_helper.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';

import '../../../../common/utils/launcher_helper.dart';

class ContactDetailButtonRow extends StatelessWidget {
  const ContactDetailButtonRow({required this.contact, super.key});
  final Contact contact;
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: context.colors.primary.withOpacity(0.3),
                ),
                child: IconButton(
                  onPressed: () => LauncherHelper.launchCall(contact.phone),
                  icon: Icon(
                    Icons.call_outlined,
                    color: context.colors.primary.dark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Call',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: context.colors.primary.withOpacity(0.3),
                ),
                child: IconButton(
                  onPressed: () => LauncherHelper.launchSMS(contact.phone),
                  icon: Icon(
                    Icons.chat_outlined,
                    color: context.colors.primary.dark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Text',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: context.colors.primary.withOpacity(0.3),
                ),
                child: IconButton(
                  onPressed: () => LauncherHelper.launchEmail(contact.email),
                  icon: Icon(
                    Icons.email_outlined,
                    color: context.colors.primary.dark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ],
      );
}
