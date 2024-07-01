import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/flashMessage/customSuccessSnackBar.dart';
import 'dart:io';

import '../../../flashMessage/customSnackBar.dart';

class TimetablePageController extends StatefulWidget {
  const TimetablePageController({super.key});

  @override
  _TimetablePageControllerState createState() =>
      _TimetablePageControllerState();
}

class _TimetablePageControllerState extends State<TimetablePageController> {
  String? selectedDepartment;
  String? selectedSemester;
  List<String> semesters = [];
  //
  //day wise time slots
  List<Map<String, dynamic>> slots = [{}];
  Map<String, dynamic> timetable = {};
  String currentSem = "semester_";
  List<String> semName = [
    "First Semester",
    "Second Semester",
    "Third Semester",
    "Fourth Semester",
    "Fifth Semester",
    "Sixth Semester",
    "Seventh Semester",
    "Eighth Semester"
  ];
  List<String> timeSlot = [];
  //[subject code,subject name,faculty name]
  List<String> facultySheetData = [];
  List<String> days = ["MON", "TUE", "WED", "THRU", "FRI", "SAT"];
  Map<String, dynamic> subjCodeDetails = {};
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Extract Data from excel file
  Future<Map<String, dynamic>> extractTimetable() async {
    //initializing btech timetable
    timetable.addAll({
      "semesters": {
        currentSem + selectedSemester!: {
          "name": semName[int.parse(selectedSemester!)-1],
          "timetable": {}
        }
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
      for (var table in excel.tables.keys) {
        //sheet variable contains number of sheet in excel:sheet?.sheetName
        var sheet = excel.tables[table];
        //Reading Faculty Sheet
        if (sheet!.sheetName == "Faculty") {
          subjCodeDetails.clear();
          for (int rowIndex = 1; rowIndex < sheet.maxRows; rowIndex++) {
            facultySheetData.clear();
            for (int colIndex = 0; colIndex < sheet.maxColumns; colIndex++) {
              var cellValue = sheet
                  .cell(CellIndex.indexByColumnRow(
                      columnIndex: colIndex, rowIndex: rowIndex))
                  .value;
              facultySheetData.add(cellValue.toString().trim());
              // print("Faculty Mapping:$facultySheetData");
            }
            subjCodeDetails.addAll({
              facultySheetData[0]: {
                "Subject": facultySheetData[1],
                "Faculty": facultySheetData[2]
              }
            });
            // print("SubjectCodeDetails$rowIndex\n: ${subjCodeDetails}");
          }
          //{KCA 201: {Subject: Theory of Automata & Formal Languages, Faculty: Ms.Janeet Kaur}
          // print("SubjectCodeDetails: ${subjCodeDetails}");
        }
        //Reading Routine sheet
        if (sheet.sheetName == "Routine") {
          timeSlot.clear();
          for (int i = 1; i < sheet.maxColumns; i++) {
            timeSlot.add(sheet
                .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
                .value
                .toString()
                .trim());
          }
          // print("TimeSlots: $timeSlot");
          for (int rowIndex = 1; rowIndex < sheet.maxRows; rowIndex++) {
            // Create a new list for each day
            List<Map<String, dynamic>> daySlots = [];
            for (int colIndex = 1; colIndex < sheet.maxColumns; colIndex++) {
              var cellValue = sheet
                  .cell(CellIndex.indexByColumnRow(
                      columnIndex: colIndex, rowIndex: rowIndex))
                  .value;
              var subCode = cellValue.toString().trim();
              // print("SubjectCodeDetails:${subjCodeDetails}");
              String key = timeSlot[colIndex - 1];
              String? subj = subjCodeDetails[subCode]?["Subject"];
              String? faculty = subjCodeDetails[subCode]?["Faculty"];
              // print("key ${key} ,subCode ${subCode},faculty ${faculty} ");
              // addSlot(key, subCode, subj, faculty);
              daySlots.add({
                "time": key,
                "subCode": subCode,
                "subject": subj,
                "faculty": faculty,
              });
              // print("Slots $rowIndex\n:$daySlots");
            }
            // print("Slots $rowIndex\n:$daySlots");
            timetable["semesters"][currentSem + selectedSemester!]
                ["timetable"]["day_${rowIndex - 1}"] = {
              "day": days[rowIndex - 1],
              "slots": daySlots,
            };
          }
        }
      }
    }
    // print("Btech Timetable:$btechTimetable");
    return timetable;
  }

  //Firebase Logic for uploading Timetable
  Future<void> createDegreeTimetable(
      String dept, String sem, Map<String, dynamic> timetableData) async {
    // print("TimeTable: ${timetableData}");
    CollectionReference degrees = firestore.collection('degrees');

    for (String semesterId in timetableData['semesters'].keys) {
      // print("SemesterId: $semesterId");
      await degrees.doc(dept).collection('semesters').doc(semesterId).set({
        'name': timetableData['semesters'][semesterId]['name'],
      });
      for (String dayId
      in timetableData['semesters'][semesterId]['timetable'].keys) {
        await degrees
            .doc(dept)
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

  //UploadTimeTable Function gets called on onClick
  Future<bool> uploadTimetable() async {
    Map<String, dynamic> result = await extractTimetable();
    print("RESULT: ${result['semesters']["semester_4"]['timetable']["day_3"]}");
    // print("RESULT:$result");
    if(result.isEmpty){
      print("Empty Content");
    }
    await createDegreeTimetable(selectedDepartment!,selectedSemester!, timetable).then((_) {
      print('Timetable updated successfully');
      return true;
    }).catchError((error) {
      print('Failed to update timetable: $error');
    });
    return false;
  }

  final Map<String, List<String>> departmentSemesters = {
    'MCA': ['1', '2', '3', '4'],
    'BTECH': ['1', '2', '3', '4', '5', '6', '7', '8'],
    'BHARMA': ['1', '2', '3', '4', '5', '6', '7', '8'],
  };

  void _updateSemesters(String department) {
    setState(() {
      semesters = departmentSemesters[department] ?? [];
      selectedSemester = null; // Reset selected semester
    });
  }

  void uploadTT() async {
    if (!_formKey.currentState!.validate()) {
      return; // Form is not valid
    }
    bool isComplete = false;
    print("Dept:$selectedDepartment, Sem:$selectedSemester");
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue[900],
          ),
        );
      },
    );
    //UploadTimetable function called
    isComplete = await uploadTimetable();
    Navigator.pop(context);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: CustomSuccessSnackBar(),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Update Timetable"),
      content: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: selectedDepartment,
                hint: Text("Select Department"),
                items: departmentSemesters.keys
                    .map((department) => DropdownMenuItem(
                          value: department,
                          child: Text(department),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value;
                    _updateSemesters(value!);
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a department';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedSemester,
                hint: Text("Select Semester"),
                items: semesters
                    .map((semester) => DropdownMenuItem(
                          value: semester,
                          child: Text(semester),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSemester = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a Semester';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Center(
          child: MaterialButton(
            onPressed: uploadTT,
            child: Text(
              "Select and Upload",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.deepPurple[800],
          ),
        ),
      ],
    );
  }
}
