import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/common/ui/components/button_component.dart';
import 'package:phone_book/common/ui/components/shimmer_container.dart';
import 'package:phone_book/common/utils/logs/log_helper.dart';
import 'package:phone_book/modules/contacts/bloc/contacts_list_bloc.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ContactsListPage extends StatelessWidget {
  ContactsListPage({Key? key}) : super(key: key);
  final RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SmartRefresher(
            physics: const BouncingScrollPhysics(),
            onRefresh: () async {
              try {
                await Provider.of<ContactsListBloc>(context, listen: false).loadContacts();
                refreshController.refreshCompleted();
              } catch (e) {
                errorLog(e);
                refreshController.refreshFailed();
              }
            },
            controller: refreshController,
            child: context.select<ContactsListBloc, bool>((bloc) => bloc.loading)
                ? Container(
                    color: Colors.red,
                  )
                : Selector<ContactsListBloc, List<Contact>>(
                    selector: (context, bloc) => bloc.contactsList,
                    builder: (context, list, child) => SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          list.length,
                          (index) => ListTile(
                            leading: CircleAvatar(
                              radius: 26,
                              child: CachedNetworkImage(imageUrl: list[index].picture?.firstOrNull ?? ''),
                            ),
                            title: Text('${list[index].firstName ?? ''} ${list[index].lastName ?? ''}'),
                            subtitle: Text(list[index].phone ?? ''),
                          ),
                        ),
                      ),
                    ),
                  )),
        floatingActionButton: FloatingActionButton.large(onPressed: () {}),
      );
}
