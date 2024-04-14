import 'package:flutter/material.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Attendance",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700),)
        ],
      ),
    );
  }
}
