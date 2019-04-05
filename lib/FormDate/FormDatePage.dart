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
  FormDate(
      {Key key,
      @required this.title,
      @required this.email,
      @optionalTypeArgs this.dateStart})
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
  final DateTime dateStart;

  //set in  title and email for this page
  @override
  FormDateState createState() => FormDateState(title, email, dateStart);
}

final _formKey = GlobalKey<FormState>();

class FormDateState extends StateMVC {
  final String email;
  final String title;

  //format the result date you want the calendar to throw
  final dateFormat = DateFormat("yyyy-MM-d h:mma");

  // in case you want a input with only hours this will be the formatter
  final timeFormat = DateFormat("h:mm a");
  DateTime dateStart;
  DateTime dateEnd;
  bool settedDate = false;

  TimeOfDay time;
  FormDateController _con;

  // Constructor to settle the title and the email and the controller
  FormDateState(this.title, this.email, this.dateStart)
      : super(FormDateController()) {
    this._con = FormDateController();
    //if dateStart change variable
    if (this.dateStart == null) {
      settedDate = true;
    }
  }

  ///method to write the view components
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: new Column(children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.all(5),
                          child: new Text("Start Date"))
                    ],
                  ),
                  settedDate
                      ? DateTimePickerFormField(
                          initialDate: dateStart,
                          initialValue: dateStart,
                          firstDate: DateTime.now(),
                          onSaved: (result) {
                            _con.saveContentFormInfo("dateStart", result);
                          },
                          format: dateFormat,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              contentPadding: EdgeInsets.all(5),
                              labelText: 'Date'),
                          onChanged: (dt) => setState(() => dateStart = dt),
                        )
                      : new Text(dateStart.toString()),
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
                    firstDate: DateTime.now(),
                    format: dateFormat,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(5),
                        labelText: 'Date'),
                    onChanged: (dt) => setState(() => dateEnd = dt),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(20.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        if (_con.checkForm(dateStart, dateEnd)) {
                          _con.submitForm(context, _formKey, email);
                        } else {
                          //show error
                          final snackBar =
                              new SnackBar(content: new Text("Error"));

                          Scaffold.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: new Text('Submit'),
                    ),
                  ),
                ]))));
  }
}
