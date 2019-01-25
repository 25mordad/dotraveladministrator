import 'dart:convert';
import 'Utils/RequestGoogle.dart';
import 'Utils/RequestScanner.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPageModel {
  RequestGoogle requestGoogle;
  RequestScanner requestScanner;

  LoginPageModel() {
    if (requestGoogle == null) {
      requestGoogle = new RequestGoogle();
    }
    if (requestScanner == null) {
      requestScanner = new RequestScanner();
    }
  }

  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<bool> checkLoginInDoTravel(String email) async {
    var content = await requestGoogle.postIntoServices(email);
    var response = json.decode(content.body);

    return response["status"] == 'ok';
  }

  Future<GoogleSignInAccount> checkLoginGoogle() async {
    GoogleSignInAccount googleInfo = await _googleSignIn.signIn();
    return googleInfo;
  }

  Future<Map<String, dynamic>> checkBarcode(String barcode) async {
    var content = await requestScanner.postIntoServices(barcode);
    var response = json.decode(content.body);
    return response;
  }
}
