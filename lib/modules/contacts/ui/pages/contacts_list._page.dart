import 'package:flutter/material.dart';
import 'package:phone_book/common/ui/components/button_component.dart';
import 'package:phone_book/common/utils/logs/log_helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ContactsListPage extends StatelessWidget {
  ContactsListPage({Key? key}) : super(key: key);
  final RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SmartRefresher(
          physics: const BouncingScrollPhysics(),
          onLoading: () async {
            try {
              refreshController.loadComplete();
            } catch (e) {
              errorLog(e);
              refreshController.loadFailed();
            }
          },
          onRefresh: () async {
            try {
              refreshController.refreshCompleted();
            } catch (e) {
              errorLog(e);
              refreshController.refreshFailed();
            }
          },
          controller: refreshController,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: List.generate(
                20,
                (index) => ListTile(
                  leading: const CircleAvatar(radius: 26),
                  title: Text(index.toString()),
                  subtitle: const Text('09130647012'),
                ),
              ),
            ),
          ),
        ),
      );
}
