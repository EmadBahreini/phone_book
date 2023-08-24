import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/common/style/colorPalette/color_palette_helper.dart';
import 'package:phone_book/common/ui/components/button_component.dart';
import 'package:phone_book/common/ui/components/cached_image_component.dart';
import 'package:phone_book/common/ui/components/page_component.dart';
import 'package:phone_book/common/ui/components/textfield_component.dart';
import 'package:phone_book/modules/contacts/bloc/contacts_bloc.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';
import 'package:provider/provider.dart';

class EditContactPage extends StatelessWidget {
  EditContactPage({required this.contact, Key? key}) : super(key: key);
  final Contact contact;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) => PageComponent(
        widgetTitle: Text(
          'edit_contact'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        appBarActions: [
          ButtonComponent(
            margin: const EdgeInsets.fromLTRB(0, 12, 16, 4),
            loading: context.select<ContactsBloc, bool>((ContactsBloc bloc) => bloc.editLoading),
            onPressed: () async {
              if (_fbKey.currentState?.saveAndValidate() ?? false) {
                var data = _fbKey.currentState?.value;
                var editedContact = Contact(
                  id: contact.id,
                  firstName: data?['first_name'],
                  lastName: data?['last_name'],
                  email: data?['email'],
                  phone: data?['phone'],
                  notes: data?['note'],
                  picture: contact.picture,
                );
                if (editedContact.isChanged(contact)) {
                  if (await Provider.of<ContactsBloc>(context, listen: false).editContact(editedContact)) {
                    if (context.mounted) {
                      context.pop(editedContact);
                    }
                  }
                } else {
                  context.pop();
                }
              }
            },
            width: 90,
            disableElevation: true,
            child: const Text('Save'),
          ),
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: FormBuilder(
            key: _fbKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: (contact.picture?.isNotEmpty ?? false)
                      ? CachedImageComponent(
                          contact.picture!.first,
                          radius: 200,
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.width / 3,
                        )
                      : CircleAvatar(
                          backgroundColor: context.colors.primary.dark,
                          radius: 60,
                          child: const Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 32,
                          ),
                        ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('add_picture'.tr()),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: context.colors.primary.dark,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFieldComponent(
                        initialValue: contact.firstName,
                        name: 'first_name',
                        hint: 'First Name',
                        isRequired: true,
                        hasBorder: true,
                        textInputAction: TextInputAction.next,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 36),
                    Expanded(
                      child: TextFieldComponent(
                        initialValue: contact.lastName,
                        name: 'last_name',
                        hint: 'Last Name',
                        isRequired: true,
                        hasBorder: true,
                        textInputAction: TextInputAction.next,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: context.colors.primary.dark,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFieldComponent(
                        initialValue: contact.phone,
                        name: 'phone',
                        hint: 'Phone',
                        isRequired: true,
                        hasBorder: true,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        validators: [FormBuilderValidators.numeric()],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: context.colors.primary.dark,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFieldComponent(
                        initialValue: contact.email,
                        name: 'email',
                        hint: 'Email',
                        isRequired: true,
                        hasBorder: true,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validators: [FormBuilderValidators.email()],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.note_outlined,
                      color: context.colors.primary.dark,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFieldComponent(
                        initialValue: contact.notes,
                        name: 'note',
                        hint: 'Note',
                        isRequired: true,
                        hasBorder: true,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
