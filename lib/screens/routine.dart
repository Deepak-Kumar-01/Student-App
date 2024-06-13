import 'package:flutter/material.dart';
import 'package:studentapp/screens/custombutton/custom_button.dart';
import 'package:studentapp/screens/home/CarouseSlider/carouselSlider.dart';

class Routine extends StatelessWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Routine",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700),),

          CarouselSlider(),
        ],
      ),
    );
  }
}
