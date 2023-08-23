import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/common/api/api_client.dart';
import 'package:phone_book/common/ui/toast.dart';
import 'package:phone_book/common/utils/logs/log_helper.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';

class ContactsBloc extends ChangeNotifier {
  List<Contact> contactsList = [];
  bool loading = false;
  bool createLoading = false;

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
      await ApiClient().retrofitClient.createContact(contact: contact).then((value) {
        infoLog(value.toJson());
        Toast.show('Contact created successfully!', type: ToastType.success);
        createLoading = false;
        loadContacts();
      }).catchError((Object obj) {
        switch (obj.runtimeType) {
          case DioException:
            final res = (obj as DioException).response;
            infoLog("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
            break;
          default:
            break;
        }
      });
      return true;
    } catch (e) {
      errorLog(e);
    }
    createLoading = false;
    notifyListeners();
    return false;
  }
}
