import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'Report.dart';
import 'dart:convert';
import 'dart:io';
import 'package:administrator_app/utils/Util.dart';

class RequestReports {
  Future<http.Response> getReports(String email) async {
    Map<String, dynamic> jsonMap = {
      "email": email,
    };
    String jsonString = json.encode(jsonMap); // encode map to json
    String paramName = 'auth'; // give the post param a name
    String formBody = paramName + '=' + Uri.encodeQueryComponent(jsonString);
    List<int> bodyBytes = utf8.encode(formBody); // utf8 encode
    return await http.post(
      Util.server + "/services/gettiming",
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: bodyBytes,
    );
  }
}
