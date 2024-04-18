
import 'package:flutter/material.dart';

// call in main.dart as
// Custom_Button(btnName: "NEXT",),
// Custom_Button(btnName: "NEXT",btnIcon: Icon(Icons.add,color: Colors.white, size: 15,),),
// Custom_Button(btnName: "NEXT", btnTextColor: Colors.white, btnFunction: () {
//                                                 print("NEXT clicked.."); },),

class Custom_Button_1 extends StatelessWidget {
  // const Custom_Button({super.key});

  final String btnName;
  final Color? btnBgColor;
  final Color? btnTextColor;
  final Icon? btnIcon;
  final double btnSize;
  final double btnFontSize;
  final double btnBorderRadius;
  final Function()? btnFunction;

  Custom_Button_1({
    required this.btnName,
    this.btnBgColor = const Color(0xFF5455B5),
    this.btnTextColor = Colors.white,
    this.btnIcon,
    this.btnBorderRadius = 21,
    this.btnFontSize = 14,
    this.btnSize = 100,
    this.btnFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnSize,
      child: ElevatedButton(
        onPressed: btnFunction,
        // onPressed: () { btnFunction(); },

        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(left: 0),
            backgroundColor: btnBgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(btnBorderRadius))
            ),
          // fixedSize: Size(200, 50), // Set width and height of the button
        ),

        // ------------if icon is passed in main.dart---------
        child:
            // Text("$btnName", style: TextStyle(color: textColor, fontSize: btnFontSize)),
            btnIcon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btnIcon!,
                      SizedBox(width: 4,),
                      Text("$btnName",
                          style: TextStyle(color: btnTextColor, fontSize: btnFontSize))
                    ],
                  )
                : Text("$btnName",
                    style: TextStyle(color: btnTextColor, fontSize: btnFontSize)),
      ),
    );
  }
}
