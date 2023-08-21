import 'package:flutter/material.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';

import '../../../../common/ui/components/cached_image_component.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final Contact contact;
  @override
  Widget build(BuildContext context) => ListTile(
        leading: CachedImageComponent(
          contact.picture?.firstOrNull,
          width: 60,
          height: 60,
          radius: 100,
        ),
        title: Text('${contact.firstName ?? ''} ${contact.lastName ?? ''}'),
        subtitle: Text(contact.phone ?? ''),
      );
}
