import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Model/FormDatePageModel.dart';
import '../../utils/Util.dart';

/**
 * Controller for form date page
 */
class FormDateController extends ControllerMVC {
  static FormDateController _this;
  static FormDatePageModel model;
  Map<String, dynamic> contentForm = {};

  ///Constructor and set up the model

  FormDateController() {
    if (model == null) {
      model = FormDatePageModel();
    }
  }

  ///call model to post the date into the server
  Future<bool> post(email, dateStart, dateEnd) async {
    var result =
        await model.postDate(email, dateStart.toString(), dateEnd.toString());
    Util.saveStringToShare("idDateStart", result["content"].toString());
    return result["status"] == "ok";
  }

  Future<DateTime> getStartDate() async {
    DateTime result = null;
    try {
      var dateStart = await Util.getStringFromSharedPreferences("dateStart");
      if (!dateStart.isEmpty) {
        result = Util.getDateFromDateTimeString(dateStart, true);
      } else {
        result = DateTime.now();
      }
    } catch (error) {
      print(error);
    }
    return result;
  }

  ///save form content into a array
  saveContentFormInfo(String key, dynamic content) {
    var result = 0;
    try {
      contentForm[key] = content;

      result = 1;
    } catch (error) {
      result = -1;
    }
    return 1;
  }

  ///validate form state and then save all the information
  submitForm(BuildContext context, GlobalKey<FormState> _formKey, email) async {
    // Validate will return true if the form is valid, or false if
    // the form is invalid.
    if (_formKey.currentState.validate()) {
      // If the form is valid, we want to show a Snackbar
      //send request to save to the server
      _formKey.currentState.save();
      if (await post(email, contentForm["dateStart"].toString(),
          contentForm["dateEnd"].toString())) {
        if (contentForm["dateEnd"] == null) {
          Util.saveStringToShare(
              "dateStart", contentForm["dateStart"].toString());
          Navigator.pop(context, "1");
        } else {
          Navigator.pop(context, -1);
        }
      }
    }
  }
}
