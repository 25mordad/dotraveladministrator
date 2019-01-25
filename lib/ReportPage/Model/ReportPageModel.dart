import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'Util/Report.dart';
import 'dart:convert';
import 'dart:io';
import 'package:administrator_app/utils/Util.dart';
import 'Util/RequestReports.dart';

class ReportPageModel {
  RequestReports request;

  ReportPageModel() {
    if (request == null) {
      request = new RequestReports();
    }
  }

  Future<List<Report>> getInfo(String email) async {
    var response = await request.getReports(email);
    var contentBody = json.decode(response.body);
    List<Report> result = new List<Report>();
    for (var row in contentBody["content"]) {
      result.add(new Report(
          row["id"], row["id_admin_user"], row["date_start"], row["date_end"]));
    }
    return result;
  }
}
