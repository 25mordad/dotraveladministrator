import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Model/FormDatePageModel.dart';

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
  Future<void> post(email, dateStart, dateEnd) async {
    var result =
        await model.postDate(email, dateStart.toString(), dateEnd.toString());
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
  submitForm(BuildContext context, GlobalKey<FormState> _formKey, email) {
    // Validate will return true if the form is valid, or false if
    // the form is invalid.
    if (_formKey.currentState.validate()) {
      // If the form is valid, we want to show a Snackbar
      //send request to save to the server
      _formKey.currentState.save();
      post(email, contentForm["dateStart"].toString(),
          contentForm["dateEnd"].toString());
      Navigator.pop(context);
    }
  }
}
