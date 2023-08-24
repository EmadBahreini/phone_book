import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/phone_book_app.dart';
import 'package:talker_flutter/talker_flutter.dart';

late Talker talker;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  talker = TalkerFlutter.init();

  runApp(const PhoneBookApp());
}
