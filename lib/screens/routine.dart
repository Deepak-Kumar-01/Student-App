import 'package:flutter/material.dart';
import 'package:studentapp/screens/custombutton/custom_button.dart';

class Routine extends StatelessWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Routine",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700),),
          Custom_Button(
            btnName: "Button",
            btnWidth: 100,
            btnBorderRadius: 5,
            btnIcon: Icon(Icons.code,color: Colors.white, size: 20,),
            btnFunction: () {
              print("Button clicked..");
            },
            btnBgColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
