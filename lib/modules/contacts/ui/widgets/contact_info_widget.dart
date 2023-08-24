import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/common/style/colorPalette/color_palette_helper.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';

import '../../../../common/utils/launcher_helper.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({required this.contact, super.key});
  final Contact? contact;
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: context.colors.primary.dark.withOpacity(0.2),
        ),
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'contact_info'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ListTile(
              onTap: () => LauncherHelper.launchCall(contact?.phone),
              leading: Icon(
                Icons.phone_outlined,
                color: context.colors.primary.dark,
              ),
              title: Text(contact?.phone ?? ''),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => LauncherHelper.launchSMS(contact?.phone),
                    icon: const Icon(Icons.chat_outlined),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () => LauncherHelper.launchEmail(contact?.email),
              leading: Icon(
                Icons.mail_outline_rounded,
                color: context.colors.primary.dark,
              ),
              title: Text(contact?.email ?? ''),
            )
          ],
        ),
      );
}
