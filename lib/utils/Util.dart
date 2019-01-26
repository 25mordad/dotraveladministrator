import 'package:flutter/material.dart';

///Class for the variables or method you're gonna use in all the project
class Util {
  //IP from the API Server
  static String serverIP = 'http://192.168.1.163';

  ///Method to show widget loading
  static Widget showLoading(bool refreshing) {
    var result = null;
    if (refreshing) {
      result = Center(
          child: new CircularProgressIndicator(
        backgroundColor: Colors.red,
      ));
    } else {
      result = Center(child: new Text("Finish"));
    }
    return result;
  }

  ///method to show snackbar in a view
  static Widget showSnackBar(GlobalKey<ScaffoldState> key, String Error) {
    key.currentState.showSnackBar(new SnackBar(content: new Text(Error)));
  }

  ///Method to pass to other Page
  static void passToOtherScreen(context, Page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page),
    );
  }
}
