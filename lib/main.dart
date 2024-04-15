import 'package:flutter/material.dart';
import 'package:studentapp/screens/homepage.dart';
import 'package:studentapp/screens/onboardingScreens.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Mobile Application",
      debugShowCheckedModeBanner: false,
      // home: Homepage(),
      home: Testing(),
    );
  }
}
class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingScreen()
    );
  }
}

