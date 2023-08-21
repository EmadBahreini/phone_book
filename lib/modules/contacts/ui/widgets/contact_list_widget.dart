import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/contacts_list_bloc.dart';
import '../../models/contact.dart';
import 'contact_list_tile.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Selector<ContactsListBloc, List<Contact>>(
        selector: (context, bloc) => bloc.contactsList,
        builder: (context, list, child) => SingleChildScrollView(
          padding: const EdgeInsets.only(top: 8),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              list.length,
              (index) => ContactListTile(contact: list[index]),
            ),
          ),
        ),
      );
}
