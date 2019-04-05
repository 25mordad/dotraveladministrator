import 'package:flutter/material.dart';
import 'package:administrator_app/ReportPage/Model/Util/Report.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'Controller/ReportPageController.dart';

///Class for ReportPage View
class ReportPage extends StatefulWidget {
  ReportPage({Key key, this.title, @required this.email}) : super(key: key);

  final String title;
  final String email;

  @override
  ReportPageState createState() => ReportPageState(title, email);
}

class ReportPageState extends StateMVC {
  ReportPageController _con;

  ///Constructor to set up the title and the email
  ReportPageState(this.title, this.email) : super(ReportPageController()) {
    this._con = ReportPageController();
  }

  final String email;
  final String title;
  Future<List<Report>> content;

  ///set the information array before starting the view
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
      //This widget is gonna wait for the response from the server and  we he reach the place and return back is gonna put all the widget like you format
      body: new FutureBuilder<List<Report>>(
        future: content,
        builder: (context, snapshot) {
          //if the result of the server has something
          if (snapshot.hasData) {
            //make the components
            List<Widget> widget = new List();
            widget.add(new Row(
              children: <Widget>[
                new Card(
                    child: new Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(_con.formatDataEmpty("ID"),
                            style: TextStyle(fontSize: 15.0)))),
                new Card(
                    child: new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_con.formatDataEmpty("DATE START"),
                            style: TextStyle(fontSize: 15.0)))),
                new Card(
                    child: new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_con.formatDataEmpty("DATE END"),
                            style: TextStyle(fontSize: 15.0)))),
              ],
            ));
            for (var row in snapshot.data) {
              widget.add(new Row(children: <Widget>[
                new Card(
                    child: new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_con.formatDataEmpty(row.id),
                            style: TextStyle(fontSize: 13.0)))),
                new Card(
                    child: new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_con.formatDataEmpty(row.date_start),
                            style: TextStyle(fontSize: 13.0)))),
                new Card(
                    child: new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_con.formatDataEmpty(row.date_end),
                            style: TextStyle(fontSize: 13.0)))),
              ]));
            }
            return new ListView(children: widget);
          } else {
            //if not show text error
            return new Text("Error");
          }

          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
