import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';
import 'Controller/LoginPageController.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  // Fields in a Widget subclass are always marked "final".
  @override
  LoginPageState createState() => new LoginPageState(this.title);
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class LoginPageState extends StateMVC {
  LoginController _con;
  String title;

  LoginPageState(this.title) : super(LoginController()) {
    this._con = LoginController();
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
            children: <Widget>[
              new RaisedButton(
                child: const Text("Login with google"),
                color: Colors.black12,
                elevation: 4.0,
                splashColor: Colors.lightBlueAccent,
                onPressed: () {
                  _con.googleLogin(context,_scaffoldKey);
                },
              ),
              new RaisedButton(
                child: const Text("Login with Scanner"),
                color: Colors.black12,
                elevation: 4.0,
                splashColor: Colors.lightBlueAccent,
                onPressed: () {
                  _con.scan();
                },
              ),
            ],
          ),
        ));
  }
}
