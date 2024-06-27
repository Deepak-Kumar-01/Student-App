import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:studentapp/modals/routine.dart';

import 'controller/timetablePageController.dart';
class AdminRoutine extends StatefulWidget {
  const AdminRoutine({super.key});

  @override
  State<AdminRoutine> createState() => _AdminRoutineState();
}

class _AdminRoutineState extends State<AdminRoutine> {
  //Show dialog to collect detail for updating time table
  void showTimetableDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const TimetablePageController();
      },
    );
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
                showTimetableDialog();
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
