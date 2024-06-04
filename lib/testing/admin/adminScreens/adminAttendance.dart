
import 'package:flutter/material.dart';

class AdminAttendance extends StatelessWidget {
  const AdminAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Attendance", style: TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
