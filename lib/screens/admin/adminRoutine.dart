import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/modals/routine.dart';

class AdminRoutine extends StatefulWidget {
  const AdminRoutine({super.key});

  @override
  State<AdminRoutine> createState() => _AdminRoutineState();
}

class _AdminRoutineState extends State<AdminRoutine> {
  List<String> days = ["MON", "TUE", "WED", "THRU", "FRI", "SAT"];
  List<String> timeSlot = [];
  List<Map<String, Map<String, dynamic>>> periodDetails = [];
  List<Map<String, dynamic>> routine = [];
  List<Map<String, dynamic>> subFacMap = [];
  List<String> codeMapping = [];
  Map<String, dynamic> subjCodeDetails = {};
  late Timetable timetable;
  List<dynamic> slots = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //testing
  final Map<String, dynamic> mcaTimetable = {
    'semesters': {
      'semester_1': {
        'name': 'Second Semester',
        'timetable': {
          'day_1': {
            'day': 'Monday',
            'slots': [
              {'time': '9:00 AM', 'subject': 'Mathematics', 'room': '101'},
              {
                'time': '11:00 AM',
                'subject': 'Computer Science',
                'room': '102'
              },
            ],
          },
          'day_2': {
            'day': 'Tuesday',
            'slots': [
              {'time': '10:00 AM', 'subject': 'Physics', 'room': '103'},
              {'time': '1:00 PM', 'subject': 'Chemistry', 'room': '104'},
            ],
          },
        },
      },
    },
  };
  Map<String, dynamic> btechTimetable = {};
  String currentSem = "semester_4";
  String semName = "Fourth Semester";


  Future<void> createDegreeTimetable(
      String degreeId, Map<String, dynamic> timetableData) async {
    print("TimeTable: ${timetableData}");
    CollectionReference degrees = firestore.collection('degrees');

    for (String semesterId in timetableData['semesters'].keys) {
      print("SemesterId: $semesterId");
      await degrees.doc(degreeId).collection('semesters').doc(semesterId).set({
        'name': timetableData['semesters'][semesterId]['name'],
      });
      for (String dayId
          in timetableData['semesters'][semesterId]['timetable'].keys) {
        await degrees
            .doc(degreeId)
            .collection('semesters')
            .doc(semesterId)
            .collection('timetable')
            .doc(dayId)
            .set({
          'day': timetableData['semesters'][semesterId]['timetable'][dayId]
              ['day'],
          'slots': timetableData['semesters'][semesterId]['timetable'][dayId]
              ['slots'],
        });
      }
    }
  }

  void extractTimeTable() async {
    btechTimetable.addAll({
      "semesters": {
        currentSem: {"name": semName, "timetable": {}}
      }
    });
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      //get subcode mapped to subject
      print(excel.tables.keys.last);
      for (var table in excel.tables.keys) {
        var sheet = excel.tables[table];
        //Reading Faculty Sheet
        if (sheet!.sheetName == "Faculty") {
          subFacMap.clear();
          routine.clear();
          for (int rowIndex = 1; rowIndex < sheet.maxRows; rowIndex++) {
            for (int colIndex = 0; colIndex < sheet.maxColumns; colIndex++) {
              var cellValue = sheet
                  .cell(CellIndex.indexByColumnRow(
                      columnIndex: colIndex, rowIndex: rowIndex))
                  .value;
              codeMapping.add(cellValue.toString());
            }
            subjCodeDetails.addAll({
              codeMapping[0]: {
                "Subject": codeMapping[1],
                "Faculty": codeMapping[2]
              }
            });
            codeMapping.clear();
          }
          break;
        } else {
          continue;
        }
      }
      //Reading Routine Sheet
      for (var table in excel.tables.keys) {
        var sheet = excel.tables[table];
        if (sheet != null && sheet.sheetName == "Routine") {
          timeSlot.clear();
          for (int i = 1; i < sheet.maxColumns; i++) {
            timeSlot.add(sheet
                .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
                .value
                .toString());
          }
          for (int rowIndex = 1; rowIndex < sheet.maxRows; rowIndex++) {
            slots.clear();

            periodDetails.clear();
            for (int colIndex = 1; colIndex < sheet.maxColumns; colIndex++) {
              var cellValue = sheet
                  .cell(CellIndex.indexByColumnRow(
                      columnIndex: colIndex, rowIndex: rowIndex))
                  .value;

              String key = timeSlot[colIndex - 1];
              String? subj = subjCodeDetails[cellValue.toString()]?["Subject"];
              String? faculty =
                  subjCodeDetails[cellValue.toString()]?["Faculty"];
              slots.add({
                'time': key,
                "Sub Code": "$cellValue",
                'subject': "$subj",
                "faculty Name": "$faculty"
              });
              print("SLOTS: $slots");
            }
            btechTimetable["semesters"][currentSem]["timetable"]
                ["day_${rowIndex - 1}"] = {
              "day": days[rowIndex - 1],
              "slots": slots
            };
          }
          // await createDegreeTimetable("btec",btechTimetable);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routine"),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                extractTimeTable();
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  shape: BoxShape.circle,
                ),
                child: Center(child: Icon(Icons.add, color: Colors.white)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Upload time table"),
            ),
          ],
        ),
      ),
    );
  }
}
