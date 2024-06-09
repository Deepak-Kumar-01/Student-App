
import 'package:flutter/material.dart';

class AdminPYQ extends StatelessWidget {
  const AdminPYQ({super.key});

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
            Text("PYQ", style: TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
