import 'package:flutter/material.dart';
class Clubs extends StatefulWidget {
  const Clubs ({super.key});

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return Scaffold(
    body: Container(
    height:size.height*0.17 ,
      width: size.width*0.60,
      decoration:BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
    ),
    );
  }
}
