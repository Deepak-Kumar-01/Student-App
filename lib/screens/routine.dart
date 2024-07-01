import 'package:flutter/material.dart';
import 'package:studentapp/screens/Routine/timetable.dart';
import '../modals/timetableModal.dart';

class Routine extends StatelessWidget {
  const Routine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int dayNumber = now.weekday;
    print("Day number: $dayNumber");

    return Scaffold(
      body: TimeTable(),
    );
  }
}
