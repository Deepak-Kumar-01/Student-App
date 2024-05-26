
import 'package:flutter/material.dart';

class PYQ extends StatefulWidget {
  const PYQ({super.key});

  @override
  State<PYQ> createState() => _PYQState();
}

class _PYQState extends State<PYQ> {
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
