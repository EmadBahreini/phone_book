import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phone_book/common/resources/assets.dart';
import 'package:provider/provider.dart';

import '../../bloc/contacts_bloc.dart';
import '../../models/contact.dart';
import 'contact_list_tile.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Selector<ContactsBloc, List<Contact>>(
        selector: (context, bloc) => bloc.contactsList,
        builder: (context, list, child) => list.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.noContact,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  Center(
                    child: Text(
                      'no_contact'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('try_add'.tr())
                ],
              )
            : SingleChildScrollView(
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
