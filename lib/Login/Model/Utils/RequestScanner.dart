import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:administrator_app/utils/Util.dart';
import 'package:barcode_scan/barcode_scan.dart';

///class to make request related to scanner
class RequestScanner {
  String url = Util.serverIP + '/services/checklogin';

  ///check into  server  the scanner login
  Future<http.Response> postCheckScannerLogin(String code) async {
    Map<String, dynamic> jsonMap = {'code': code};
    String jsonString = json.encode(jsonMap); // encode map to json
    String paramName = 'code'; // give the post param a name
    String formBody = paramName + '=' + Uri.encodeQueryComponent(jsonString);
    List<int> bodyBytes = utf8.encode(formBody); // utf8 encode
    return await http.post(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: bodyBytes,
    );
  }
}
