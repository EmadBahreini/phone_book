import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/common/api/api_client.dart';
import 'package:phone_book/common/ui/toast.dart';
import 'package:phone_book/common/utils/logs/log_helper.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';

class ContactsBloc extends ChangeNotifier {
  List<Contact> contactsList = [];
  bool loading = false;
  bool createLoading = false;
  bool deleteLoading = false;

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

  Future<bool> createContact(Contact contact) async {
    createLoading = true;
    notifyListeners();
    try {
      var res = await ApiClient().retrofitClient.createContact(contact: contact);
      if (res.errorMessage == null) {
        Toast.show('Contact created successfully!', type: ToastType.success);
        createLoading = false;
        loadContacts();
        return true;
      } else {
        Toast.show(res.errorMessage!);
        createLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      errorLog(e);
    }
    createLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> deleteContact(Contact contact) async {
    deleteLoading = true;
    notifyListeners();
    Toast.showLoading();
    try {
      var res = await ApiClient().retrofitClient.deleteContact(contact.id);
      if (res.errorMessage == null) {
        Toast.show('Contact deleted successfully!', type: ToastType.success);
        deleteLoading = false;
        loadContacts();
        BotToast.closeAllLoading();
        return true;
      } else {
        Toast.show(res.errorMessage!);
        deleteLoading = false;
        notifyListeners();
        BotToast.closeAllLoading();
        return false;
      }
    } catch (e) {
      errorLog(e);
    }
    deleteLoading = false;
    notifyListeners();
    return false;
  }
}
