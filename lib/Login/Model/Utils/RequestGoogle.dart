import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';
import 'package:administrator_app/utils/Util.dart';

class RequestGoogle {




  Future<http.Response> postIntoServices(String email) async {
    Map<String, dynamic> jsonMap = {'email': email};
    String jsonString = json.encode(jsonMap); // encode map to json
    String paramName = 'email'; // give the post param a name
    String formBody = paramName + '=' + Uri.encodeQueryComponent(jsonString);
    List<int> bodyBytes = utf8.encode(formBody); // utf8 encode
    return await http.post(
      Util.server + "/services/checklogin",
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: bodyBytes,
    );
  }


}
