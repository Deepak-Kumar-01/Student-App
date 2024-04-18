import 'package:flutter/material.dart';

class AttendanceList_Widget_1 extends StatelessWidget {
  // const AttendanceList_Widget({super.key});
  var subjectDetails = [
    {
      "subjectCode": "KCA201",
      "subjectName": "Theory of Automata & Formal Languages",
      "subjectTeacher": "Ms. Janeet Kaur",
    },
    {
      "subjectCode": "KCA202",
      "subjectName": "Object Oriented Programming",
      "subjectTeacher": "Ms. Shobha G",
    },
    {
      "subjectCode": "KCA203",
      "subjectName": "Operating Systems",
      "subjectTeacher": "Ms. Abha Sharma",
    },
    {
      "subjectCode": "KCA204",
      "subjectName": "Database Management Systems",
      "subjectTeacher": "Ms. Megha Gupta",
    },
    {
      "subjectCode": "KCA205",
      "subjectName": "Data Structures & Analysis of Algorithms",
      "subjectTeacher": "Ms. Priyanka Gupta",
    },
    {
      "subjectCode": "KCAA01",
      "subjectName": "Cyber Security",
      "subjectTeacher": "Ms. Megha Gupta",
    },
    {
      "subjectCode": "KCA251",
      "subjectName": "Object Oriented Programming Lab",
      "subjectTeacher": "Ms. Shobha G",
    },
    {
      "subjectCode": "KCA252",
      "subjectName": "DBMS Lab",
      "subjectTeacher": "Ms. Megha Gupta",
    },
    {
      "subjectCode": "KCA253",
      "subjectName": "Data Structures & Analysis of Algorithms Lab",
      "subjectTeacher": "Ms. Priyanka Gupta",
    },
  ];

  var studentAttendance = [
    {
      "subjectCode": "KCA202",
      "percent": "100",
    },{
      "subjectCode": "KCA201",
      "percent": "99",
    },{
      "subjectCode": "KCA203",
      "percent": "60",
    },{
      "subjectCode": "KCA204",
      "percent": "85",
    },{
      "subjectCode": "KCA205",
      "percent": "90",
    },{
      "subjectCode": "KCAA01",
      "percent": "100",
    },{
      "subjectCode": "KCA251",
      "percent": "70",
    },{
      "subjectCode": "KCA252",
      "percent": "100",
    },{
      "subjectCode": "KCA253",
      "percent": "88",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFE5E5EC),
        ),
        child: ListView.builder(
          itemCount: subjectDetails.length,
          itemBuilder: (context, index) {
            var subjectCode = subjectDetails[index]["subjectCode"];
            var subjectName = subjectDetails[index]["subjectName"];
            var subjectTeacher = subjectDetails[index]["subjectTeacher"];
            // var subjectAttendance = studentAttendance[index];
            var subjectAttendance = studentAttendance[index]["subjectCode"] == subjectCode 
                ? studentAttendance[index]["percent"]
                : "Null";

            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text("KCA"),
                        Text(subjectDetails[index]["subjectCode"]!),
                      ],
                    ),
                    title: Text(subjectName!),
                    subtitle: Text(subjectTeacher!,
                        style: TextStyle(color: Color(0xFF5E5E5E))),

                    trailing: Container(
                        color: Colors.blue,
                        child: Text(
                          "$subjectAttendance", // displaying attendance
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            );
          },
        ));
  }
}
