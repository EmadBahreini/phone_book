import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/common/ui/components/simple_app_bar.dart';
import 'package:phone_book/common/ui/components/switcher_component.dart';
import 'package:phone_book/common/utils/logs/log_helper.dart';
import 'package:phone_book/modules/contacts/bloc/contacts_bloc.dart';
import 'package:phone_book/modules/contacts/ui/widgets/add_contact_button.dart';
import 'package:phone_book/modules/contacts/ui/widgets/contact_list_shimmer.dart';
import 'package:phone_book/modules/contacts/ui/widgets/contact_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ContactsListPage extends StatelessWidget {
  ContactsListPage({Key? key}) : super(key: key);
  final RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SimpleAppBar(
          'app_title'.tr(),
          elevation: 12,
          titleWidget: Text(
            'app_title'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          haveLeading: false,
          centerTitle: true,
        ),
        body: SmartRefresher(
          physics: const BouncingScrollPhysics(),
          onRefresh: () async {
            try {
              await Provider.of<ContactsBloc>(context, listen: false).loadContacts();
              refreshController.refreshCompleted();
            } catch (e) {
              errorLog(e);
              refreshController.refreshFailed();
            }
          },
          controller: refreshController,
          child: SwitcherComponent(
            duration: const Duration(milliseconds: 250),
            statement: context.select<ContactsBloc, bool>((bloc) => bloc.loading),
            firstChild: const ContactListShimmer(),
            secondChild: const ContactListWidget(),
          ),
        ),
        floatingActionButton: const AddContactWidget(),
      );
}
