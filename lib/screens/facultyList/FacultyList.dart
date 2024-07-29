import 'package:flutter/material.dart';
class FacultyList extends StatelessWidget {
  const FacultyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faculty List",style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.blue[800],
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the back arrow color here
        ),
      ),
      body: Center(
        child: Text("Coming Soon..."),
      ),
    );
  }
}
