import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700),)
        ],
      ),
    );
  }
}
