import 'dart:convert';
import 'dart:io';

import '../../utils/RequestsDate.dart';

///Model For Main Page
class MainPageModel {
  ///method to post dates into the server
  Future<Map> editDate(
      String id, String email, String dateStart, String dateEnd) async {
    RequestsDate request = new RequestsDate();

    var response = await request.editDateRequest(id, email, dateStart, dateEnd);
    var result = json.decode(response.body);
    return result;
  }
}
