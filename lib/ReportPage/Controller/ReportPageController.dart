import 'package:mvc_pattern/mvc_pattern.dart';
import '../Model/ReportPageModel.dart';
import '../Model/Util/Report.dart';

class ReportPageController extends ControllerMVC {
  static ReportPageController _this;
  static ReportPageModel model;

  ReportPageController() {
    if (model == null) {
      model = ReportPageModel();
    }
  }

  Future<List<Report>> getInformation(String email) async {
    List<Report> response = await model.getInfo(email);
    return response;
  }

  formatDataEmpty(String data) {
    return data == null ? " " : " " + data + " ";
  }
}
