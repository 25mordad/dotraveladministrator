import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'Controller/LoginPageController.dart';

///Class for Login Page View
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  // Fields in a Widget subclass are always marked "final".
  @override
  LoginPageState createState() => new LoginPageState(this.title);
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class LoginPageState extends StateMVC {
  LoginPageController _con;
  String title;

  //set up the controller and the title of the page
  LoginPageState(this.title) : super(LoginPageController()) {
    this._con = LoginPageController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login Google",
                style: TextStyle(fontSize: 18.0),
              ),
              Ink(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                decoration: ShapeDecoration(
                  color: Colors.lightBlueAccent,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.cloud),
                  color: Colors.white,
                  onPressed: () {
                    _con.googleLogin(context, _scaffoldKey);
                  },
                ),
              ),
              Text(
                "Login QRCode",
                style: TextStyle(fontSize: 18.0),
              ),
              Ink(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                decoration: ShapeDecoration(
                  color: Colors.blueAccent,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Colors.white,
                  onPressed: () {
                    _con.scan();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
