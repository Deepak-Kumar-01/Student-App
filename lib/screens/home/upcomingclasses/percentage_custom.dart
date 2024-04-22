
// Create custom percetnage circle : not wroking

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:studentapp/widgets/api_of_subjects.dart';

class Percentage_Custom extends StatelessWidget {
  var studentAttendance = [
    100,
    66,
    75,
    98,
    100,
    66,
    75,
    98,
    77,
    66,
    75,
    98,
    77
  ];

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

  double attendanceCircleRadius = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        color: Colors.blue,
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: subjectDetails.length,
                    itemBuilder: (context, index) {
                    return Container(
                      width: 40,
                      height: 40,
                      child: Container(
                        width: 35,
                        height: 35,
                      ),
                    );
                  },
                  )
                  ,
                ),
                SizedBox(
                  height: 5,
                )
              ],
            );
          },
        )
    );
  }
}

// ---------working, place inside row------------
//Container(
//                 width: attendanceCircleRadius,
//                 height: attendanceCircleRadius,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100),
//                   color: 70 >= 75 ? Colors.green : Colors.red,
//                 ),
//                 child: Container(
//                   width: attendanceCircleRadius-5,
//                   height: attendanceCircleRadius-5,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: Colors.white,
//                   ),
//                   child: Text(
//                     "70%",
//                     style: TextStyle(fontSize: 13),
//                   ),
//                 )),


// ------------------------------------------
//Container(
//       height: 40,
//       // width: 40,
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           var subjectCode = subjectDetails[index]["subjectCode"];
//           var subjectName = subjectDetails[index]["subjectName"];
//           var subjectTeacher = subjectDetails[index]["subjectTeacher"];
//           var subjectAttendance = studentAttendance[index];
//
//           return Container(
//             height: 100,
//             child: Container(
//                 width: 40,
//                 height: 40,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100),
//                   color: subjectAttendance >= 75 ? Colors.green : Colors.red,
//                 ),
//                 child: Container(
//                   width: 35,
//                   height: 35,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: Colors.white,
//                   ),
//                   child: Text(
//                     "$subjectAttendance%",
//                     style: TextStyle(fontSize: 13),
//                   ),
//                 )),
//           );
//         },
//
//         // scrollDirection: Axis.horizontal,
//         itemCount: studentAttendance.length, // defines the number of items in a list.
//       ),
//     )
