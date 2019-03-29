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
  bool settedDate = false;
  String content = "Add";

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

  closeDay() async {
    var dateStart = Util.getContentFromSharedPreferences("dateStart");
    var dateId = Util.getContentFromSharedPreferences("idDateStart");
    //edit content

    setState(() {
      settedDate = false;
      content =
          Util.getMinutesBeetweenDates(dateStart, DateTime.now().toString())
              .toString();
    });

    Util.removeContentFromSharedPreferences("dateStart");
    Util.removeContentFromSharedPreferences("idDateStart");
  }

  Future<String> getCounter() async {
    var result = "Add";
    var dateStart = await Util.getStringFromSharedPreferences("dateStart");
    if (dateStart != null) {
      var result =
          Util.getMinutesBeetweenDates(dateStart, DateTime.now().toString())
              .toString();
    }
    return result;
  }

  ///method to pass to form date
  passToFormDate(BuildContext context, String email) async {
    //start time go to form included times
    var resultPageForm = await Util.passToOtherScreen(
        context, FormDate(title: "Form Date", email: email));
    if (resultPageForm != null) {
      if (resultPageForm == "1") {
        var dateStart = await Util.getStringFromSharedPreferences("dateStart");
        var result =
            Util.getMinutesBeetweenDates(dateStart, DateTime.now().toString())
                .toString();
        stateView.setState(() {
          settedDate = true;
          content = "dd";
        });
      } else {
        //show error
      }
    }
  }
}
