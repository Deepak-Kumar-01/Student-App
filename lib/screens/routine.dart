import 'package:flutter/material.dart';

class Routine extends StatelessWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Routine",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700),),
        ],
      ),
    );
  }
}
