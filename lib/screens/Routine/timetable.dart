import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:studentapp/screens/Routine/timetable_api.dart';

var routineapi_1 = {
  "monday": [
    {"subject": "Math", "time": "09:00-10:00", "room": "101"},
    {"subject": "English", "time": "10:15-11:15", "room": "102"}
  ],
  "Tuesday": [
    {"subject": "Physics", "time": "09:00-10:00", "room": "201"},
    {"subject": "Chemistry", "time": "10:15-11:15", "room": "202"}
  ],
  "Saturday": [
    {"subject": "CS", "time": "09:00-10:00", "room": "201"},
    {"subject": "Chemistry", "time": "10:15-11:15", "room": "202"}
  ],
};

List<String> days = ["monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

DateTime dateTime = DateTime.now();

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  
  var subject = routineapi["monday"]?[1]["subject"];
  var time = routineapi["monday"]?[1]["time"];
  var room = routineapi["monday"]?[1]["room"];

  // Generate a list of the next 5 days including the current date
  List<DateTime> nextDays = List.generate(7, (index) {
    return dateTime.add(Duration(days: index));
  });
  // var abc = dateTime.weekday;

  // Selected day for routine display
  String selectedDay = DateFormat("EEEE").format(dateTime).toLowerCase();
  String dayName = DateFormat("EEEE").format(dateTime).toLowerCase();

  @override
  Widget build(BuildContext context) {
    dateTime = DateTime.now();

    return Scaffold(
      body: Column(
        children: [
          // ================ upper part =============================
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nextDays.length,

              itemBuilder: (context, index) {
                DateTime day = nextDays[index]; // current DateTime details
                dayName = DateFormat("EEEE").format(day).toLowerCase();
                // print(day);

                return InkWell(
                  onTap: () {
                    print("${DateFormat("EEEE").format(day)}");
                    setState(() {
                      selectedDay = DateFormat("EEEE").format(day).toLowerCase();
                      // abc = selectedDay;
                    });
                  },
                  child: Container(
                    width: 80,
                    // color: Colors.blueAccent,
                    color: selectedDay == dayName ? Colors.greenAccent : Colors.blueAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${DateFormat("dd").format(day)}"),
                        Text("${DateFormat("E").format(day).toUpperCase()}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // ===================================================
          Container(
            height: 80,
            child: Column(
              children: [
                Text("$selectedDay"),
                // Text("$abc"),
              ],
            ),
          ),

          //============================
          Expanded(
            child: RoutineDetails(),
          ),
        ],
      ),
    );
  }
}


// ===================================================
class RoutineDetails extends StatefulWidget {
  const RoutineDetails({super.key});

  @override
  State<RoutineDetails> createState() => _RoutineDetailsState();
}

class _RoutineDetailsState extends State<RoutineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: double.infinity,
        // height: 200,
        decoration: BoxDecoration(
          color: Color(0xFFE5E5EC),
        ),
        child: ListView.builder(
          itemCount: routineapi["monday"]?.length,
          itemBuilder: (context, index) {
            var subjectTime = routineapi["monday"]?[index]["time"];
            var subjectCode = routineapi["monday"]?[index]["subjectCode"];
            var subjectName = routineapi["monday"]?[index]["subjectName"];
            var subjectTeacher = routineapi["monday"]?[index]["subjectTeacher"];

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 9, right: 9, top: 5, bottom: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ListTile(
                      leading: Text(
                        subjectTime!,
                        style: TextStyle(fontSize: 12),
                      ),
                      title: Text(
                        "$subjectName ($subjectCode)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(subjectTeacher!,
                          style: TextStyle(color: Color(0xFF5E5E5E))),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}