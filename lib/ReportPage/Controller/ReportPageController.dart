import 'package:mvc_pattern/mvc_pattern.dart';
import '../Model/ReportPageModel.dart';
import '../Model/Util/Report.dart';

///Report Page Controller
class ReportPageController extends ControllerMVC {
  static ReportPageController _this;
  static ReportPageModel model;

  ///set up the model
  ReportPageController() {
    if (model == null) {
      model = ReportPageModel();
    }
  }

  ///method to get the information from the server
  Future<List<Report>> getInformation(String email) async {
    List<Report> response = await model.getInfo(email);
    return response;
  }

  ///method to format data if is empty
  formatDataEmpty(String data) {
    return data == null ? " " : " " + data + " ";
  }
}
