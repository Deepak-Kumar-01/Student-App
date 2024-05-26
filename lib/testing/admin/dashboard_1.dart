import 'dart:js';

import 'package:flutter/material.dart';

import '../../screens/appbar/appbarmenu.dart';
import '../../screens/appbar/custom_appbar_shape.dart';
import '../../screens/responsiveScreens/dimensions.dart';


class Dashboard extends StatelessWidget {
  // const Dashboard({super.key});
  var studentAttendance = [
    100, 66, 75, 98, 100, 66, 75, 98, 77, 66, 75, 98, 77
  ];

  final List<String> containerDetails = [
    "Attendance",
    "Faculty",
    "Notes",
    "PYQ",
    "Routine",
    "Society",
    "Notification",
  ];

  final List<Color> colors = [
    // Color(0xffF3F9F9), //white
    // Color(0xff2F334E), //black
    Color(0xff3C70FD), //blue
    Color(0xffF11E60), //red
    Color(0xff8C4DE8), //purple
    // Color(0xff01DB64), //green
    Color(0xff00c95d), //green
  ];


  // Widget container_widget(String container_text, Color container_color) {
  //   return  ;
  // }

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

    return Scaffold(

      drawer: Drawer(
        backgroundColor: Colors.blue,
      ),

      appBar: AppBar(
        // toolbarHeight: 100,
        toolbarHeight: size.width <= smallDeviceWidth ? 100:130,
        // toolbarHeight: size.height*0.18,
        automaticallyImplyLeading: false,  // to disable auto menu button when using drawer
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white), // Change the color of the drawer icon here
        shadowColor: Colors.transparent,
        excludeHeaderSemantics: true,
        elevation: 0.0,
        forceMaterialTransparency: true,
        centerTitle: true,

        flexibleSpace: ClipPath(
          clipper: CustomAppBarShape(), //<<<===
          child: Container(
            // // height: 150,
            // width: MediaQuery.of(context).size.width,
            color: Colors.blue[700],

            //======AppBar Menu======
            child: AppBarMenu(),
          ),
        ),
      ),



      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child: Center(
            child: Wrap(
              spacing: 5.0, // Horizontal spacing
              runSpacing: 5.0, // Vertical spacing
              alignment: WrapAlignment.center,

              children: List.generate(containerDetails.length, (index) {
                return Card(
                  elevation: 11,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    // side: BorderSide(color: Color(0xff2F334E), width: 1),
                  ),
                  // color: Colors.blue,
                  child: Dashboard_Container_1(
                    containerText: containerDetails[index],
                    containerColor: colors[index % colors.length],
                  ),
                );
              }
              ),
            ),
          ),
        ),
      ),
    );

  }
}


//-------------------------------------------------
class Dashboard_Container_1 extends StatelessWidget {
  // const Dashboard_Container_1({super.key});

  final double containerHeight;
  final double containerWidth;
  final Color containerColor;
  final Color fontColor;
  final String containerText;
  final Function()? containerFunction;


  Dashboard_Container_1({
    this.containerHeight = 100,
    this.containerWidth = 105,
    required this.containerColor,
    this.fontColor = Colors.white70,
    required this.containerText,
    this.containerFunction = defaultFunction,
    // this.containerColor = const Color(0xFF2196F3),
    // this.containerText = "Container Text",
  });

  static void defaultFunction() {
    print("Default function...");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        // color: Color(0xff8C4DE8),
        // color: Color(0xffF11E60),
        color: containerColor,
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(
        //   color: Colors.black,
        //   width: 1.3,
        // ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(containerText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xffF3F9F9)),
            ),
          ),

          Container(
              decoration: BoxDecoration(
                  // color: Color(0xffF3F9F9),
                  color: Color(0xff2F334E),
                  // color: Color(0xff01DB64),
                  // color: Color(0xff3C70FD),
                  // color: Color(0xffF11E60),
                  // color: Color(0xff8C4DE8),
                  // color: Color(0xff),

                  border: Border(
                      // top: BorderSide(color: Color(0xffF3F9F9), width: 1)
                  ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8), )
              ),

            child: TextButton(
              onPressed: () {
                print("object");
              },
              child: Row(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('MANAGE', style: TextStyle(color: Color(0xffF3F9F9)),), // Your text
                  // Spacer(),
                  // SizedBox(width: 2,),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.6),
                    child: Icon(Icons.arrow_forward_ios, color: Color(0xffF3F9F9), size: 17,),
                  ), // Your icon
                ],
              ),
            ),
          ),


          // Container(
          //   height: 30,
          //   decoration: BoxDecoration(
          //       color: Colors.purple[200],
          //       border: Border(
          //           top: BorderSide(color: Colors.black, width: 1)
          //       ),
          //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8), )
          //   ),
          //
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Container(
          //         height: 1, // Height of the line
          //         color: Colors.black, // Color of the line
          //       ),
          //       Text(
          //         "MANAGE",
          //         style: TextStyle(),
          //       ),
          //       IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.arrow_forward,
          //           size: 20,
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}



// return Scaffold(
//   body: Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: GridView.builder(
//
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 120, // Max width for each item
//         mainAxisSpacing: 8.0, // Vertical spacing
//         crossAxisSpacing: 8.0, // Horizontal spacing
//         childAspectRatio: 1, // Aspect ratio of the items
//       ),
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Container(
//           width: 100,
//           height: 100,
//           color: Colors.blue,
//         );
//       },
//     ),
//   ),
// );


// return Scaffold(
//   body: Wrap(
//     // crossAxisAlignment: WrapCrossAlignment.start,
//     alignment: WrapAlignment.spaceEvenly,
//     spacing: 8.0, // Horizontal spacing between containers
//     runSpacing: 8.0, // Vertical spacing between containers
//     children: List.generate(10, (index) {
//       print("object : $index");
//       return Container(
//         width: 100,
//         height: 100,
//         color: Colors.blue,
//       );
//     }),
//   ),
// );

// return ListView.builder(itemBuilder: (context, index) {
//   return Wrap(
//     alignment: WrapAlignment.center,
//     direction: Axis.horizontal,
//     spacing: 11,
//     runSpacing: 11,
//     children: [Dashboard_Container_1()],
//   );
// },
//   itemCount: 4,
//   scrollDirection: Axis.horizontal,
// );
