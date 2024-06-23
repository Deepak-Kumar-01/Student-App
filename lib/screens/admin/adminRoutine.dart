import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:studentapp/modals/routine.dart';
class AdminRoutine extends StatefulWidget {
  const AdminRoutine({super.key});

  @override
  State<AdminRoutine> createState() => _AdminRoutineState();
}

class _AdminRoutineState extends State<AdminRoutine> {
  //day wise time slots
  List<Map<String,dynamic>> slots=[{}];
  Map<String, dynamic> btechTimetable = {};
  String currentSem = "semester_4";
  String semName = "Fourth Semester";
  List<String> timeSlot = [];
  //[subject code,subject name,faculty name]
  List<String> facultySheetData=[];
  List<String> days = ["MON", "TUE", "WED", "THRU", "FRI", "SAT"];
  Map<String, dynamic> subjCodeDetails = {};
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  void addSlot(String time, String? subCode, String? subject,String? facultyName) {
    slots.add({
      "time": time,
      "subject code":subCode,
      "subject name": subject,
      "faculty name": facultyName,
    });
  }
  //Extract Data from excel file
  Future<Map<String, dynamic>> extractTimetable()async{
    //initializing btech timetable
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
    if(result!=null){
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      for(var table in excel.tables.keys){
        //sheet variable contains number of sheet in excel:sheet?.sheetName
        var sheet = excel.tables[table];
        //Reading Faculty Sheet
        if(sheet!.sheetName == "Faculty"){
          facultySheetData.clear();
          for (int rowIndex = 1; rowIndex < sheet.maxRows; rowIndex++){
            for (int colIndex = 0; colIndex < sheet.maxColumns; colIndex++){
              var cellValue = sheet
                  .cell(CellIndex.indexByColumnRow(
                  columnIndex: colIndex, rowIndex: rowIndex))
                  .value;
              facultySheetData.add(cellValue.toString());
            }
            subjCodeDetails.addAll({
              facultySheetData[0]: {
                "Subject": facultySheetData[1],
                "Faculty": facultySheetData[2]
              }
            });
          }
          //{KCA 201: {Subject: Theory of Automata & Formal Languages, Faculty: Ms.Janeet Kaur}
          // print("SubjectCodeDetails: ${subjCodeDetails}");
        }
        //Reading Routine sheet
        if(sheet.sheetName=="Routine"){
          timeSlot.clear();
          for (int i = 1; i < sheet.maxColumns; i++) {
            timeSlot.add(sheet
                .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
                .value
                .toString());
          }
          // print("TimeSlots: $timeSlot");
          for (int rowIndex = 1; rowIndex < sheet.maxRows; rowIndex++){
            List<Map<String, dynamic>> daySlots = []; // Create a new list for each day
            // slots.clear();
            // btechTimetable.clear();
            for (int colIndex = 1; colIndex < sheet.maxColumns; colIndex++){
              var cellValue = sheet
                  .cell(CellIndex.indexByColumnRow(
                  columnIndex: colIndex, rowIndex: rowIndex))
                  .value;
              var subCode=cellValue.toString();
              String key = timeSlot[colIndex - 1];
              String? subj = subjCodeDetails[cellValue.toString()]?["Subject"];
              String? faculty = subjCodeDetails[cellValue.toString()]?["Faculty"];
              // addSlot(key, subCode, subj, faculty);
              daySlots.add({
                "time": key,
                "subCode": subCode,
                "subject": subj,
                "faculty": faculty,
              });
            }
            // print("Slots $rowIndex\n:$slots");
            btechTimetable["semesters"][currentSem]["timetable"]
            ["day_${rowIndex - 1}"] = {
              "day": days[rowIndex - 1],
              "slots": daySlots,
            };
          }
        }
      }
    }
    return btechTimetable;
  }
  //Firebase Logic for uploading Timetable
  Future<void> createDegreeTimetable(String degreeId, Map<String, dynamic> timetableData) async {
    // print("TimeTable: ${timetableData}");
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
  //UploadTimeTable Function gets called on onClick
  void uploadTimetable ()async{
    Map<String, dynamic> result=await extractTimetable();
    await createDegreeTimetable("btec", btechTimetable).then((_) {
      print('Timetable updated successfully');
    }).catchError((error) {
      print('Failed to update timetable: $error');
    });
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
                uploadTimetable();
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
