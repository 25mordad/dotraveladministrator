import 'dart:convert';
import 'dart:io';

import 'Utils/RequestsDate.dart';

class FormDatePageModel {
  var request;

  FormDatePageModel() {
    if (request == null) {
      request = new RequestsDate();
    }
  }

  Future<bool> postDate(String email, String dateStart, String dateEnd) async {
    var response = await request.postDateRequest(email, dateStart, dateEnd);
    var result = json.decode(response.body);
    return result["status"] == "ok";
  }
}
