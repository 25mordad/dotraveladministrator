import 'dart:async';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';
import 'Controller/MainPageController.dart';

/// Class for view MainPage
class MainPage extends StatefulWidget {
  MainPage({Key key, this.title, this.email}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String email;

  @override
  MainPageState createState() => MainPageState(title, email);
}

class MainPageState extends StateMVC {
  final String title;
  final String email;
  String _textFromFile;
  MainPageController _con;

  ///Constructor to set up the controller, the  title and keep the email from the login Page
  MainPageState(this.title, this.email) : super(MainPageController()) {
    initState();

    this._con = MainPageController();
    if (this != null) {
      try {
        var timer = Timer.periodic(
            Duration(seconds: 1),
            (Timer t) => _con.getCounter().then((val) => setState(() {
                  if (val != null) {
                    _textFromFile = val;
                  }
                })));
      } catch (error) {
        //print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
          child: new Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
            Text(
              "Set the hours",
              style: TextStyle(fontSize: 18.0),
            ),
            Ink(
              decoration: ShapeDecoration(
                color: Colors.blue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.access_time),
                color: Colors.white,
                onPressed: () {
                  if (_con.settedDate) {
                    _con.closeDay();
                  } else {
                    _con.passToFormDate(context, email);
                  }
                },
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_textFromFile == null ? "" : _textFromFile,
                  style: TextStyle(fontSize: 13.0)),
            ),
          ]))),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(children: <Widget>[
                Text(
                  email,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ]),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text('Report'),
              onTap: () {
                //go to report page

                _con.passToReportPage(context, email);
              },
            ),
          ],
        ),
      ),
    );
  }
}
