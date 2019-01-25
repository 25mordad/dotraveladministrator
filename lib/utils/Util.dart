import 'package:flutter/material.dart';

class Util {
  static String server = 'http://192.168.1.163';

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

  static Widget showSnackBar(GlobalKey<ScaffoldState> key, String Error) {
    key.currentState.showSnackBar(new SnackBar(content: new Text(Error)));
  }

  static void passToOtherScreen(context, Page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page),
    );
  }

  static Future<String> showCalendar(context) async {
    //return picked.toString();
  }
}
