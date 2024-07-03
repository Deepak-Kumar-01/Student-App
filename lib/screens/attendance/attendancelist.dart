import 'package:flutter/material.dart';

class AttendanceList extends StatelessWidget {
  // const AttendanceList_Widget({super.key});
  var subjectDetails = [
    {
      "subjectCode": "KCA201",
      "subjectName": "Theory of Automata & Formal Languages",
      "subjectShortForm": "TAFL",
      "subjectTeacher": "Ms. Janeet Kaur",
    },
    {
      "subjectCode": "KCA202",
      "subjectName": "Object Oriented Programming",
      "subjectShortForm": "OOPs",
      "subjectTeacher": "Ms. Shobha G",
    },
    {
      "subjectCode": "KCA203",
      "subjectName": "Operating Systems",
      "subjectShortForm": "OS",
      "subjectTeacher": "Ms. Abha Sharma",
    },
    {
      "subjectCode": "KCA204",
      "subjectName": "Database Management Systems",
      "subjectShortForm": "DBMS",
      "subjectTeacher": "Ms. Megha Gupta",
    },
    {
      "subjectCode": "KCA205",
      "subjectName": "Data Structures & Analysis of Algorithms",
      "subjectShortForm": "DSA",
      "subjectTeacher": "Ms. Priyanka Gupta",
    },
    {
      "subjectCode": "KCAA01",
      "subjectName": "Cyber Security",
      "subjectShortForm": "CS",
      "subjectTeacher": "Ms. Megha Gupta",
    },
    {
      "subjectCode": "KCA251",
      "subjectName": "Object Oriented Programming Lab",
      "subjectShortForm": "OOPs Lab",
      "subjectTeacher": "Ms. Shobha G",
    },
    {
      "subjectCode": "KCA252",
      "subjectName": "DBMS Lab",
      "subjectShortForm": "DBMS Lab",
      "subjectTeacher": "Ms. Megha Gupta",
    },
    {
      "subjectCode": "KCA253",
      "subjectName": "Data Structures & Analysis of Algorithms Lab",
      "subjectShortForm": "DSA Lab",
      "subjectTeacher": "Ms. Priyanka Gupta",
    },
  ];

  // List<int> studentAttendance = [90, 86, 75, 98, 89, 99, 100, 100, 89];
  var studentAttendance = [100, 66, 75, 98, 69, 99, 100, 60, 89];

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
            var subjectAttendance = studentAttendance[index];

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
                        Text(subjectCode!, style: TextStyle(fontSize: 12),),
                      ],
                    ),
                    title: Text(subjectName!, style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    subtitle: Text(subjectTeacher!,
                        style: TextStyle(color: Color(0xFF5E5E5E))),

                    trailing: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: subjectAttendance >= 75 ? Colors.green : Colors.red,
                        ),
                        child: Container(
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: Text(
                            "$subjectAttendance%",
                            style: TextStyle(fontSize: 13),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            );
          },
        ),
    );
  }
}
