import 'package:flutter/material.dart';
import 'package:studentapp/screens/homepage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Mobile Application",
      home: Homepage(),
    );
  }
}
