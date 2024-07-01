import 'package:flutter/material.dart';
import 'package:my_first_app/faculty.dart';
import 'package:my_first_app/views/profile.dart';




void main() {
  runApp( MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp( {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home:Profile(),
    );
  }
}

