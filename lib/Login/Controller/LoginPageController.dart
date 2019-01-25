import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:administrator_app/utils/Util.dart';
import '../../MainPage/MainPage.dart';
import '../../utils/Util.dart';
import 'package:flutter/material.dart';
import '../Model/LoginPageModel.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:barcode_scan/barcode_scan.dart';

class LoginController extends ControllerMVC {
  static LoginPageModel model;

  LoginController() {
    if (model == null) {
      model = new LoginPageModel();
    }
  }

  Future<String> scan() async {
    //show error message and hide loading
    bool scan = await submitScan();
    String message = "";
    if (scan) {
      message = "Login Succesful";
    } else {
      message = "Error on Login";
    }
    return message;
  }

  Future<String> googleLogin(BuildContext context ,GlobalKey<ScaffoldState> _scaffoldKey) async {
    var result = "";
    Map<String, dynamic> isSign = await handleSignIn();
    if (isSign["status"] == "ok") {
      Util.passToOtherScreen(
          context, MainPage(title: "Main Page", email: isSign["email"]));
    } else {
      Util.showSnackBar(_scaffoldKey, "Error with google login!");
    }
    return result;
  }

  Future<Map<String, dynamic>> handleSignIn() async {
    bool response = false;
    Map<String, dynamic> result = new Map();
    GoogleSignInAccount googleInfo = await model.checkLoginGoogle();

    if (googleInfo != null) {
      response = await model.checkLoginInDoTravel(googleInfo.email);
    }
    if (response) {
      result["email"] = googleInfo.email;
      result["status"] = "ok";
    } else {
      result["status"] = "error";
    }
    return result;
  }

  Future<bool> submitScan() async {
    bool result = false;
    try {
      String barcode = await BarcodeScanner.scan();
      var response = await model.checkBarcode(barcode);
      if (response != null) {
        result = response["status"] == "ok";
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return result;
  }
}
