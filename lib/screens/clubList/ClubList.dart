import 'package:flutter/material.dart';
class ClubList extends StatelessWidget {
  const ClubList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Club List",style: TextStyle(
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
