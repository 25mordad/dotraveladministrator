import 'dart:convert';
import 'dart:io';

import '../../utils/RequestsDate.dart';

/**
 * Model for FormDatePage
 */
class FormDatePageModel {
  var request;

  //singleton for requests dates
  FormDatePageModel() {
    if (request == null) {
      request = new RequestsDate();
    }
  }

  ///method to post dates into the server
  Future<Map> postDate(String email, String dateStart, String dateEnd) async {
    var response = await request.postDateRequest(email, dateStart, dateEnd);
    var result = json.decode(response.body);
    return result;
  }

  ///method to post dates into the server
  Future<Map> editDate(
      String id, String email, String dateStart, String dateEnd) async {
    var response = await request.editDateRequest(id, email, dateStart, dateEnd);
    var result = json.decode(response.body);
    return result;
  }
}
