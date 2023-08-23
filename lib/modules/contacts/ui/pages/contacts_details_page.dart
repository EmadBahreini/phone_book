import 'package:flutter/material.dart';
import 'package:phone_book/common/style/colorPalette/color_palette_helper.dart';
import 'package:phone_book/common/ui/components/cached_image_component.dart';
import 'package:phone_book/common/ui/components/page_component.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';
import 'package:phone_book/modules/contacts/ui/widgets/contact_detail_buttons_row.dart';
import 'package:phone_book/modules/contacts/ui/widgets/contact_info_widget.dart';

class ContactsDetailsPage extends StatelessWidget {
  const ContactsDetailsPage({required this.contact, Key? key}) : super(key: key);
  final Contact contact;
  @override
  Widget build(BuildContext context) => PageComponent(
        alwaysElevation: true,
        enableAppBarAnimation: false,
        backLeading: true,
        appBarActions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_outlined,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 24,
            ),
          ),
        ],
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: CachedImageComponent(
                  contact.picture?.firstOrNull,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  radius: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  '${contact.firstName} ${contact.lastName}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ContactDetailButtonRow(contact: contact),
              ContactInfoWidget(contact: contact),
              Container(
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
                        'Note',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      contact.notes ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(height: 1.8, fontWeight: FontWeight.normal, fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
