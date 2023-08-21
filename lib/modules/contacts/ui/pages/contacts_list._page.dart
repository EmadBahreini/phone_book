import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/common/ui/components/button_component.dart';
import 'package:phone_book/common/ui/components/shimmer_container.dart';
import 'package:phone_book/common/ui/components/simple_switcher_component.dart';
import 'package:phone_book/common/ui/components/switcher_component.dart';
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text('STDev Phone Book'),
        ),
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
          child: SwitcherComponent(
              duration: const Duration(milliseconds: 250),
              statement: context.select<ContactsListBloc, bool>((bloc) => bloc.loading),
              firstChild: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: List.generate(
                    6,
                    (index) => const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: [
                          ShimmerContainer(
                            height: 60,
                            width: 60,
                            radius: 100,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                ShimmerContainer(
                                  height: 10,
                                ),
                                SizedBox(height: 16),
                                ShimmerContainer(
                                  height: 10,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              secondChild: Selector<ContactsListBloc, List<Contact>>(
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
        ),
        floatingActionButton: FloatingActionButton.large(onPressed: () {}),
      );
}
