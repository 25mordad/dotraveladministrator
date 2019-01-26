import 'dart:convert';
import 'Utils/RequestGoogle.dart';
import 'Utils/RequestScanner.dart';
import 'package:google_sign_in/google_sign_in.dart';

///Login Page Model
class LoginPageModel {
  RequestGoogle requestGoogle;
  RequestScanner requestScanner;

  ///Constructor to set the objects request
  LoginPageModel() {
    if (requestGoogle == null) {
      requestGoogle = new RequestGoogle();
    }
    if (requestScanner == null) {
      requestScanner = new RequestScanner();
    }
  }

  //scopes that we need to make the google login
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  ///method to check the login in dotravel
  Future<bool> checkLoginInDoTravel(String email) async {
    var content = await requestGoogle.postCheckGoogleLogin(email);
    var response = json.decode(content.body);

    return response["status"] == 'ok';
  }

  ///method to check the login for google
  Future<GoogleSignInAccount> checkLoginGoogle() async {
    GoogleSignInAccount googleInfo = await _googleSignIn.signIn();
    return googleInfo;
  }

  //method to check if the barcode is right
  Future<Map<String, dynamic>> checkBarcode(String barcode) async {
    var content = await requestScanner.postCheckScannerLogin(barcode);
    var response = json.decode(content.body);
    return response;
  }
}
