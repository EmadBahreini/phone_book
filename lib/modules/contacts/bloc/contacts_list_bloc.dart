import 'package:flutter/material.dart';
import 'package:phone_book/common/api/api_client.dart';
import 'package:phone_book/common/utils/logs/log_helper.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';

class ContactsListBloc extends ChangeNotifier {
  List<Contact> contactsList = [];
  bool loading = false;

  Future<void> loadContacts() async {
    loading = true;
    notifyListeners();
    try {
      var response = await ApiClient().retrofitClient.getContactsList();
      if (response?.isNotEmpty ?? false) {
        contactsList
          ..clear()
          ..addAll(response!);
      }
    } catch (e) {
      errorLog(e);
    }
    loading = false;
    notifyListeners();
  }
}
