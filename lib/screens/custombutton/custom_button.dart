//========How to use Custom_Button==========
//          Custom_Button(
//             btnName: "CODE-ZEN",
//             btnSize: 100,
//             btnBorderRadius: 5,
//             btnIcon: Icon(Icons.code,color: Colors.white, size: 20,),
//             btnFunction: () {
//               print("CODE-ZEN clicked..");
//             },
//           ),

import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  // const Custom_Button_2({super.key});

  final String btnName;
  final Color? btnBgColor;
  final Color? btnTextColor;
  final Icon? btnIcon;
  final double btnWidth;
  final double btnHeight;
  final double btnTextSize;
  final double btnBorderRadius;
  final Function()? btnFunction;

  // the properties which are initialized are the default properties
  Custom_Button({
    required this.btnName,
    this.btnBgColor = const Color(0xFF5455B5),
    this.btnTextColor = Colors.white,
    this.btnIcon,
    this.btnBorderRadius=50,
    this.btnTextSize = 14,
    this.btnWidth = 100,
    this.btnHeight = 14,
    this.btnFunction = defaultFunction,
  });

  static void defaultFunction() {
    print("Default function...");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150,
      child: ElevatedButton(
        onPressed: btnFunction,
        // onPressed: () { btnFunction(); },

        style: ElevatedButton.styleFrom(
          backgroundColor: btnBgColor,
          padding: EdgeInsets.only(left: 0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnBorderRadius)
          ),
          fixedSize: Size(btnWidth, btnHeight), // Set width and height of the button
        ),

        child: btnIcon == null ?
        Text("$btnName",
            style: TextStyle(color: btnTextColor, fontSize: btnTextSize)
        ) :
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnIcon!,
            Text("$btnName",
                style: TextStyle(color: btnTextColor, fontSize: btnTextSize)),
          ],
        ),
      ),
    );
  }
}

// --------------Calling in main.dart--------------------
// Custom_Button(
// btnName: "NEXT", btnSize: 80,
// btnBorderRadius: 50,
// // btnFunction: () {
// //   print("NEXT clicked..");
// // },
// ),
//
// SizedBox(height: 11,),
//
// Custom_Button(
// btnName: "CODE-ZEN",btnSize: 100,
// btnBorderRadius: 5,
// btnIcon: Icon(Icons.code,color: Colors.white, size: 20,),
// btnFunction: () {
// print("CODE-ZEN clicked..");
// },
// ),


