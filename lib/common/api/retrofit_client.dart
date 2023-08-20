import 'package:dio/dio.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';

import 'package:retrofit/retrofit.dart';

import 'api.dart';

part 'retrofit_client.g.dart';

@RestApi()
abstract class RetrofitClient {
  factory RetrofitClient({required Dio dio}) => _RetrofitClient(dio);

  //! Contacts
  @GET(Api.getContactsList)
  Future<List<Contact>?> getContactsList();
}
