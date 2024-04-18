import 'package:flutter/material.dart';

class Button_Inkwell extends StatelessWidget {
  const Button_Inkwell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              print("object");
            },
            child: Container(
              width: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hello"),
              ),
              color: Colors.red,
            ),
          ),

          // -------------------------------
    Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text("CODE-ZEN",style: TextStyle(fontSize: 12),),
        ),
      ),
    ),
        ],
      ),
    );
  }
}
