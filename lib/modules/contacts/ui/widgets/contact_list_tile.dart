import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';

import '../../../../common/router/app_router.dart';
import '../../../../common/ui/components/cached_image_component.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final Contact contact;
  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => context.go(R.contactsDetails, extra: contact),
        leading: CachedImageComponent(
          contact.picture?.firstOrNull,
          width: 50,
          height: 50,
          radius: 200,
        ),
        title: Text(
          '${contact.firstName ?? ''} ${contact.lastName ?? ''}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
        ),
        subtitle: Text(contact.phone ?? ''),
      );
}
