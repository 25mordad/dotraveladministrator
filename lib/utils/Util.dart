import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Class for the variables or method you're gonna use in all the project
class Util {
  //IP from the API Server
  static String serverIP = 'http://192.168.1.225';

  //SharedPreferences prefs = await SharedPreferences.getInstance();
  static Future<bool> saveStringToShare(String dataName, String data) async {
    var result = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(dataName, data);
      result = true;
    } on Exception catch (e) {
      print(e.toString());
    }
    return result;
  }

  static Object getContentFromSharedPreferences(String dataName) async {
    var result = null;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      result = prefs.getString(dataName);
    } on Exception catch (e) {
      print(e.toString());
    }
    return result;
  }

  static Future<String> getStringFromSharedPreferences(String dataName) async {
    var result = null;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String getData = prefs.getString(dataName);
      if (getData != null) {
        result = getData;
      }
    } on Exception catch (e) {
      //print(e.toString());
    }
    return result;
  }

  static void removeContentFromSharedPreferences(String dataName) async {
    var result = null;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      result = prefs.remove(dataName);
    } on Exception catch (e) {
      print(e.toString());
    }
    return result;
  }

  static DateTime getDateFromDateTimeString(String dateWithHours, bool hours) {
    var result = null;
    try {
      var date = dateWithHours.split(" ");

      var dateFormatted = date[0].split("-");
      if (hours) {
        var dateHours = date[1].split(":");
        result = new DateTime(
          int.parse(dateFormatted[0]),
          int.parse(dateFormatted[1]),
          int.parse(dateFormatted[2]),
          int.parse(dateHours[0]),
          int.parse(dateHours[1]),
          int.parse(dateHours[2].split(".")[0]),
        );
      } else {
        result = new DateTime(int.parse(dateFormatted[0]),
            int.parse(dateFormatted[1]), int.parse(dateFormatted[2]));
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return result;
  }

  static dynamic getMinutesBeetweenDates(String dateStart, String dateEnd) {
    var result = null;
    try {
      var date1 = Util.getDateFromDateTimeString(dateStart, true);
      var date2 = Util.getDateFromDateTimeString(dateEnd, true);
      if (date1.difference(date2).inHours < 24) {
        result = date2.difference(date1).inMinutes.toString() +
            " Minutes has been" +
            " pass since you started you're day";
      } else {
        result = "Date started on " + date1.toString();
      }
    } catch (error) {
      print(error);
    }
    return result;
  }

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
  static Object passToOtherScreen(context, Page) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page),
    );
  }
}
