import 'package:flutter/material.dart';
import 'package:administrator_app/ReportPage/Model/Util/Report.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'Controller/ReportPageController.dart';

class ReportPage extends StatefulWidget {
  ReportPage({Key key, this.title, @required this.email}) : super(key: key);

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
  ReportPageState createState() => ReportPageState(title, email);
}

class ReportPageState extends StateMVC {
  ReportPageController _con;

  ReportPageState(this.title, this.email) : super(ReportPageController()) {
    this._con = ReportPageController();
  }

  final String email;
  final String title;
  Future<List<Report>> content;

  @override
  void initState() {
    content = _con.getInformation(email);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new FutureBuilder<List<Report>>(
        future: content,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Widget> widget = new List();
            widget.add(new Row(
              children: <Widget>[
                new Text("ID "),
                new Text(" DATE START "),
                new Text(" DATE END ")
              ],
            ));
            for (var row in snapshot.data) {
              widget.add(new Row(children: <Widget>[
                new Text(_con.formatDataEmpty(row.id)),
                new Text(_con.formatDataEmpty(row.date_start)),
                new Text(_con.formatDataEmpty(row.date_end))
              ]));
            }
            return new Column(children: widget);
          } else {
            return new Text("Error");
          }

          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
