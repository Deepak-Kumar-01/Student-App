import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:studentapp/screens/Routine/timetable_api.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  var subject = routineapi["monday"]?[1]["subject"];
  var time = routineapi["monday"]?[1]["time"];
  var room = routineapi["monday"]?[1]["room"];
  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now();

    // Generate a list of the next 5 days including the current date
    List<DateTime> nextDays = List.generate(7, (index) {
      return dateTime.add(Duration(days: index));
    });

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nextDays.length,
              itemBuilder: (context, index) {
                DateTime day = nextDays[index]; // current DateTime details

                return InkWell(
                  onTap: (){
                    print("$index");
                  },
                  child: Container(
                    width: 80,
                    color: Colors.blueAccent,
                    alignment: Alignment.center,
                    child: Text("${DateFormat("dd").format(day)}\n${DateFormat("E").format(day)}"),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
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
                  var subjectTeacher =
                  routineapi["monday"]?[index]["subjectTeacher"];

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
                      // SizedBox(
                      //   height: 5,
                      // )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}