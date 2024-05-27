import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:studentapp/services/authentication.dart';
import 'package:studentapp/services/databaseServices.dart';
import 'package:studentapp/services/secureStorage.dart';

import '../../modals/users.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<Map<String, dynamic>> setAuthForStudent = [];
  Map<String, dynamic> rowMap = {};
  List<String> headers = [];

  AuthServices _authRef = AuthServices();
  DatabaseServices _databaseRef = DatabaseServices();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
        backgroundColor: Color(0xff00c95d),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: size.width * 0.7,
          child: Column(
            children: [
              //Create New Session
              ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.account_box,
                        ),
                      ),
                      Text("Create New Session"),
                    ],
                  )),
              //Edit Ongoing Session
              ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit,
                        ),
                      ),
                      Text("Edit Ongoing Session"),
                    ],
                  )),
              //Temporary Create Auth for Students
              ElevatedButton(
                  // onPressed: selectExcelFile,
                  onPressed: extractUserAuthDetail,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.login,
                        ),
                      ),
                      Text("Create Auth for Students"),
                    ],
                  )),
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
                rowMap['role']="student";
              }
            }
            setAuthForStudent.add(rowMap);
            String email = "${rowMap['universityEmailId'].toString()}@jssaten.ac.in";
            await _authRef.createAuthCredential(
                email,
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
