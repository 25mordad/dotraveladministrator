import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:administrator_app/utils/Util.dart';
import '../../FormDate/FormDatePage.dart';
import 'package:flutter/material.dart';

import '../../ReportPage/ReportPage.dart';
import '../Model/MainPageModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

///Class Controller for the main Page
class MainPageController extends ControllerMVC {
  static MainPageController _this;
  static MainPageModel model;

  ///Constructor to set up the model
  MainPageController() {
    if (model == null) {
      model = MainPageModel();
    }
  }

  ///method to pass to Report Page
  passToReportPage(BuildContext context, String email) {
    Util.passToOtherScreen(
        context, ReportPage(title: "Main Page", email: email));
  }

  ///method to pass to form date
  passToFormDate(BuildContext context, String email) {
    //start time go to form included times
    Util.passToOtherScreen(context, FormDate(title: "Form Date", email: email));
  }
}
