import 'package:flutter/material.dart';
import 'package:administrator_app/login/LoginPage.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

void main() => runApp(MyApp());

///This is the main Class of the application you're gonna set up the application name the themes and the main Page
class MyApp extends AppMVC {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Administrator Dotravel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'DoTravel Admnistrator'),
    );
  }
}
