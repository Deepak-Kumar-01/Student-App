import 'package:flutter/material.dart';
class clubs extends StatelessWidget {
  const clubs ({super.key});

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
