import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/common/style/colorPalette/color_palette_helper.dart';
import 'package:phone_book/common/ui/components/cached_image_component.dart';
import 'package:phone_book/common/ui/components/page_component.dart';
import 'package:phone_book/common/ui/widgets/loading_widget.dart';
import 'package:phone_book/modules/contacts/bloc/contacts_bloc.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';
import 'package:phone_book/modules/contacts/ui/widgets/contact_detail_buttons_row.dart';
import 'package:phone_book/modules/contacts/ui/widgets/contact_info_widget.dart';
import 'package:provider/provider.dart';

class ContactsDetailsPage extends StatelessWidget {
  ContactsDetailsPage({required this.contact, Key? key}) : super(key: key);
  final Contact contact;
  final MenuController controller = MenuController();
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
          MenuAnchor(
            controller: controller,
            builder: (context, controller, child) => IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(
                Icons.more_vert,
                size: 24,
              ),
            ),
            menuChildren: [
              ListTile(
                enabled: !context.select<ContactsBloc, bool>((bloc) => bloc.deleteLoading),
                title: Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: Row(
                    children: [
                      Text(
                        'Delete',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: context.colors.error.dark),
                      ),
                      const SizedBox(width: 8),
                      if (context.select<ContactsBloc, bool>((bloc) => bloc.deleteLoading)) const LoadingWidget()
                    ],
                  ),
                ),
                onTap: () async {
                  controller.close();
                  if (await Provider.of<ContactsBloc>(context, listen: false).deleteContact(contact)) {
                    if (context.mounted) {
                      context.pop();
                    }
                  }
                },
              ),
              MenuItemButton(
                child: const Text('Share'),
                onPressed: () {},
              ),
            ],
          )
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
