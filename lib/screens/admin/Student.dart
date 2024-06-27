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
  String? createdByName;
  AuthServices _authRef = AuthServices();
  DatabaseServices _databaseRef = DatabaseServices();
  TextEditingController _sessionController= TextEditingController();
  TextEditingController _nameController=TextEditingController();
  TextEditingController _dobController=TextEditingController();
  TextEditingController _roleController=TextEditingController();
  TextEditingController _universityRollNoController=TextEditingController();
  TextEditingController _admissionNoController=TextEditingController();
  TextEditingController _universityEmailController=TextEditingController();
  TextEditingController _personalEmailController=TextEditingController();
  TextEditingController _currentSemController=TextEditingController();


  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _sessionController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _roleController.dispose();
    _universityRollNoController.dispose();
    _admissionNoController.dispose();
    _universityEmailController.dispose();
    _personalEmailController.dispose();
    _currentSemController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                    InkWell(
                      onTap: () {
                        _createSession();
                      },
                      borderRadius: BorderRadius.circular(50), // Adjust the radius to make it fully circular
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Icon(Icons.add,color:Colors.white)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Create New Session"),
                    ),
                  ],
                ),
              ),
              //Create role based auth
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // _createRoleBasedAuthCred();
                        _assignRoleToStudent();
                      },
                      borderRadius: BorderRadius.circular(50), // Adjust the radius to make it fully circular
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Icon(Icons.add,color:Colors.white)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Assign Role to student"),
                    ),
                  ],
                ),
              ),
              //Create New User
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _createNewUserAuth("null");
                      },
                      borderRadius: BorderRadius.circular(50), // Adjust the radius to make it fully circular
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                            child: Icon(Icons.add,color:Colors.white)
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Create New User"),
                    ),
                  ],
                ),
              ),
              //Edit Ongoing Session
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Your onTap action here
                      },
                      borderRadius: BorderRadius.circular(50), // Adjust the radius to make it fully circular
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Icon(Icons.add,color:Colors.white)
                        ),
                      ),
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
                    InkWell(
                      onTap: () {
                        extractUserAuthDetail();
                      },
                      borderRadius: BorderRadius.circular(50), // Adjust the radius to make it fully circular
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Icon(Icons.add,color:Colors.white)
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Create Auth for Students"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Your onTap action here
                      },
                      borderRadius: BorderRadius.circular(50), // Adjust the radius to make it fully circular
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Icon(Icons.add,color:Colors.white)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Edit Ongoing Session"),
                    ),
                  ],
                ),
              ),
              //Testing Custom Excel File

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
          print("header: $headers");
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
  void _createSession() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(

            title: Text("Create New Session"),
            content:Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _sessionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Start"),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: TextField(
                      controller: _sessionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("End"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  // Todo todo = Todo(
                  //     task: _todoController.text,
                  //     isDone: false,
                  //     createdOn: Timestamp.now(),
                  //     updatedOn: Timestamp.now());
                  // _databaseServices.addTodo(todo);
                  // Navigator.pop(context);
                  // _todoController.clear();
                },
                child: Text("Create",style: TextStyle(color: Colors.white),),
                color: Colors.deepPurple[800],
              )
            ],
          );
        });
  }
  void _assignRoleToStudent() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(

            title: Text("Assign Role"),
            content:Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: Column(
                children: [
                  TextField(
                    controller: _sessionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("UniqueId/Email"),
                    ),
                  ),
                  // SizedBox(width: 20,),
                  TextField(
                    controller: _sessionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("DOB"),
                    ),
                  ),
                  TextField(
                    controller: _sessionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                        label: Text("Enter Role to assign"),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  // Todo todo = Todo(
                  //     task: _todoController.text,
                  //     isDone: false,
                  //     createdOn: Timestamp.now(),
                  //     updatedOn: Timestamp.now());
                  // _databaseServices.addTodo(todo);
                  // Navigator.pop(context);
                  // _todoController.clear();
                },
                child: Text("Update",style: TextStyle(color: Colors.white),),
                color: Colors.deepPurple[800],
              )
            ],
          );
        });
  }
  void _createNewUserAuth(String? currentAppUser) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(

            title: Text("Create New User"),
            content:Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Name"),
                      ),
                    ),
                    // SizedBox(width: 20,),
                    TextField(
                      controller: _dobController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("DOB"),
                      ),
                    ),
                    TextField(
                      controller: _roleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Role:student/admin/club/cr"),
                      ),
                    ),
                    TextField(
                      controller: _universityRollNoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("UniversityRollNo"),
                      ),
                    ),
                    TextField(
                      controller: _admissionNoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Admission Number"),
                      ),
                    ),
                    TextField(
                      controller: _universityEmailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("University Email"),
                      ),
                    ),
                    TextField(
                      controller: _personalEmailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Personal Email"),
                      ),
                    ),
                    TextField(
                      controller: _currentSemController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Current Semester"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  AppUser appUser = AppUser(
                      name: _nameController.text,
                      universityRoll: _universityRollNoController.text,
                      universityEmailId: _universityEmailController.text,
                      admissionNo: _admissionNoController.text,
                      personalEmail: _personalEmailController.text,
                      dob: _dobController.text,
                      currentSemester: _currentSemController.text,
                      isVerified: false,
                      createdBy: currentAppUser??"null",
                      role: _roleController.text,
                      createdOn: Timestamp.now());
                  print(appUser.toJson());
                },
                child: Text("Create",style: TextStyle(color: Colors.white),),
                color: Colors.deepPurple[800],
              )
            ],
          );
        });
  }
}

