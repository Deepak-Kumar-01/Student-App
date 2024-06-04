
import 'package:flutter/material.dart';

class AdminFaculty extends StatelessWidget {
  const AdminFaculty({super.key});

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
            Text("Faculty", style: TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
