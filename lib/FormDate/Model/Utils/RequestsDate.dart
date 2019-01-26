import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';
import 'package:administrator_app/utils/Util.dart';

/**
 * Class to make the request information for dates
 */
class RequestsDate {
  ///Post dates into the server
  Future<http.Response> postDateRequest(
      String email, String dateStart, String dateEnd) async {
    Map<String, dynamic> jsonMap = {
      "email": email,
      'dateStart': dateStart,
      "dateEnd": dateEnd
    };
    String jsonString = json.encode(jsonMap); // encode map to json
    String paramName = 'dates'; // give the post param a name
    String formBody = paramName + '=' + Uri.encodeQueryComponent(jsonString);
    List<int> bodyBytes = utf8.encode(formBody); // utf8 encode
    return await http.post(
      Util.serverIP + "/services/checkin",
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: bodyBytes,
    );
  }
}
