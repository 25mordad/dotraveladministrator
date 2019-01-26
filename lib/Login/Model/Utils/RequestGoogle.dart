import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';
import 'package:administrator_app/utils/Util.dart';

///Class to make the request for things related to google services

class RequestGoogle {
  ///method to check google login
  Future<http.Response> postCheckGoogleLogin(String email) async {
    Map<String, dynamic> jsonMap = {'email': email};
    String jsonString = json.encode(jsonMap); // encode map to json
    String paramName = 'email'; // give the post param a name
    String formBody = paramName + '=' + Uri.encodeQueryComponent(jsonString);
    List<int> bodyBytes = utf8.encode(formBody); // utf8 encode
    return await http.post(
      Util.serverIP + "/services/checklogin",
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: bodyBytes,
    );
  }
}
