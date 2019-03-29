import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:flutter/material.dart';
import 'package:administrator_app/utils/Util.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'Controller/FormDatePageController.dart';

/**
 * View FormDate
 */
class FormDate extends StatefulWidget {
  FormDate({Key key, @required this.title, @required this.email})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String email;

  //set in  title and email for this page
  @override
  FormDateState createState() => FormDateState(title, email);
}

final _formKey = GlobalKey<FormState>();

class FormDateState extends StateMVC {
  final String email;
  final String title;

  //format the result date you want the calendar to throw
  final dateFormat = DateFormat("yyyy-MM-d h:mma");

  // in case you want a input with only hours this will be the formatter
  final timeFormat = DateFormat("h:mm a");
  DateTime date;
  TimeOfDay time;
  FormDateController _con;
  DateTime _startTime;

  // Constructor to settle the title and the email and the controller
  FormDateState(this.title, this.email) : super(FormDateController()) {
    this._con = FormDateController();
    //get StartTime
    _con.getStartDate().then((val) => setState(() {
          _startTime = val;
        }));
  }

  ///method to write the view components
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Form(
            key: _formKey,
            child: new Column(children: <Widget>[
              new Row(
                children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.all(5), child: new Text("Start Date"))
                ],
              ),
              DateTimePickerFormField(
                initialDate: _startTime,
                onSaved: (result) {
                  _con.saveContentFormInfo("dateStart", result);
                },
                format: dateFormat,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5), labelText: 'Date'),
                onChanged: (dt) => setState(() => date = dt),
              ),
              new Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: new Text("End Date"),
                  )
                ],
              ),
              DateTimePickerFormField(
                onSaved: (result) {
                  _con.saveContentFormInfo("dateEnd", result);
                },
                format: dateFormat,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5), labelText: 'Date'),
                onChanged: (dt) => setState(() => date = dt),
              ),
              new Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5), child: new Text("Notes"))
                ],
              ),
              new Column(
                children: <Widget>[
                  new TextFormField(
                    onSaved: (result) {
                      _con.saveContentFormInfo("notes", result);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(5)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    _con.submitForm(context, _formKey, email);
                  },
                  child: new Text('Submit'),
                ),
              ),
            ])));
  }
}
