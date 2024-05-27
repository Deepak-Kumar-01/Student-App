import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes",style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}
