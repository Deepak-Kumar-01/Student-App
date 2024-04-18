
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class Dateandtime extends StatefulWidget {
  const Dateandtime({Key?key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateandTimePickerState ();
}

class _DateandTimePickerState extends State<Dateandtime> {

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime? currentdy= today;
    return Scaffold(
      appBar: AppBar(
        title:Text('Date and Time'),
      ),
      body: Column( children: [
        TableCalendar(

          firstDay: DateTime(2000),
          lastDay: DateTime(2030),
          focusedDay: today,
        ),

      ],

      ),
    );
  }
}