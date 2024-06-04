import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studentapp/services/excelHandler.dart';
import 'dart:io';
import '../../modals/users.dart';
import '../../services/authentication.dart';
import '../../services/databaseServices.dart';
import '../../services/secureStorage.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  List<Map<String, dynamic>> setAuthForStudent = [];
  Map<String, dynamic> rowMap = {};
  List<String> headers = [];

  AuthServices _authRef = AuthServices();
  DatabaseServices _databaseRef = DatabaseServices();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print("Height${size.height}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Student",style: TextStyle(color: Colors.white),),
        // backgroundColor: Color(0xff00c95d),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: size.width * 0.7,
          child: Column(
            children: [
              //Create New Session
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                        onPressed: (){},
                      child: Icon(Icons.add,color: Colors.white,),
                      backgroundColor: Colors.blue[800],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Create New Session"),
                    ),
                  ],
                ),
              ),
              //Edit Ongoing Session
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                      onPressed: (){},
                      child: Icon(Icons.add,color: Colors.white,),
                      backgroundColor: Colors.blue[800],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Edit Ongoing Session"),
                    ),
                  ],
                ),
              ),
              //Temporary Create Auth for Students
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                      onPressed: extractUserAuthDetail,
                      child: Icon(Icons.add,color: Colors.white,),
                      backgroundColor: Colors.blue[800],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Create Auth for Students"),
                    ),
                  ],
                ),
              ),
              //Testing Custom Excel File
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                      onPressed: ExcelHandler().extractUserAuthDetail,
                      child: Icon(Icons.add,color: Colors.white,),
                      backgroundColor: Colors.blue[800],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Handling Custom Excel"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void extractUserAuthDetail() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );
    if (result != null) {
      setAuthForStudent.clear();
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      for (var table in excel.tables.keys) {
        var sheet = excel.tables[table];
        if (sheet != null) {
          headers.clear();
          //Keys are extracted
          for (int i = 0; i < sheet.maxColumns; i++) {
            headers.add(sheet
                .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
                .value
                .toString());
          }
          print(sheet.maxRows);
          //keys mapped to its value object file created
          for (int rowIndex = 1; rowIndex < sheet.maxRows; rowIndex++) {
            for (int colIndex = 0; colIndex < sheet.maxColumns; colIndex++) {
              var cellValue = sheet
                  .cell(CellIndex.indexByColumnRow(
                  columnIndex: colIndex, rowIndex: rowIndex))
                  .value;
              if (headers[colIndex] == 'dob') {
                String extractedDate = cellValue.toString();
                DateTime parsedDate = DateTime.parse(extractedDate);
                String formattedDate = DateFormat('dd-MM-yyyy')
                    .format(parsedDate)
                    .replaceAll("-", "");
                rowMap[headers[colIndex]] = formattedDate;
              } else {
                rowMap[headers[colIndex]] = cellValue;
                rowMap['role'] = "student";
              }
            }
            setAuthForStudent.add(rowMap);
            await _authRef.createAuthCredential(
                rowMap['universityEmailId'].toString(),
                rowMap['dob'].toString());
            print("USER: ${FirebaseAuth.instance.currentUser?.uid} ");
            String uid = "${FirebaseAuth.instance.currentUser?.uid}";
            final adminUID = await UserSecureStorage.getUserUID();
            AppUser appUser = AppUser(
                name: rowMap['studentName'].toString(),
                universityRoll: rowMap['universityRoll'].toString(),
                universityEmailId: rowMap['universityEmailId'].toString(),
                admissionNo: rowMap['admissionNo'].toString(),
                personalEmail: rowMap['personalEmailId'].toString(),
                dob: rowMap['dob'],
                currentSemester: "1",
                isVerified: false,
                createdBy: adminUID.toString(),
                role: "student",
                createdOn: Timestamp.now());
            await _databaseRef.addUser(appUser);
            print(rowMap['dob']);
          }
          // print(setAuthForStudent);
          //List of Student objects
        }
      }
    }
  }
}
