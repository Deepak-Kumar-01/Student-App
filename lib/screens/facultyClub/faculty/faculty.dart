import 'package:flutter/material.dart';
class Faculty extends StatelessWidget {
  const Faculty({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return  Container(
      height:size.height*0.2 ,
      width: size.width*0.60,
      decoration:BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),

    );
  }
}
