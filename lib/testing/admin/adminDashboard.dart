import 'package:flutter/material.dart';
import 'package:studentapp/screens/responsiveScreens/dimensions.dart';

import '../../screens/appbar/appbarmenu.dart';
import '../../screens/appbar/custom_appbar_shape.dart';
import '../../screens/attendance.dart';
import '../../screens/custombutton/custom_button.dart';
import '../../screens/facultyClub/faculty/faculty.dart';
import '../../screens/routine.dart';
import 'adminScreens/Notes.dart';
import 'adminScreens/PYQ.dart';
import 'adminScreens/Society.dart';
import 'adminScreens/notificationAdmin.dart';

class AdminDashboard extends StatelessWidget {
  // const Dashboard({super.key});

  final List<String> containerDetails = [
    "Attendance",
    "Faculty",
    "Notes",
    "Notification",
    "PYQ",
    "Routine",
    "Society",
  ];

  final List<Color> colors = [
    // Color(0xffF3F9F9), //white
    // Color(0xff2F334E), //black
    Color(0xff3C70FD), //blue
    Color(0xffF11E60), //red
    Color(0xff8C4DE8), //purple
    // Color(0xff01DB64), //green
    Color(0xff00c95d), //green
    Color(0xff3C70FD), //blue
    Color(0xffF11E60), //red
    Color(0xff8C4DE8), //purple
    Color(0xff00c95d), //green
    // ----------------------------------

    // Color(0xff3C70FD), //blue
    // Color(0xffF11E60), //red
    // Color(0xff8C4DE8), //purple
    // // Color(0xff01DB64), //green
    // Color(0xff00c95d), //green
    //
    // Color(0xff0d6f41), //green
    // Color(0xff004e31), //green
    //
    // Color(0xffed8c32), //
    // Color(0xffcc561e), //
    //
    // Color(0xfff44a3c), //
    // Color(0xffca1812), //
    //
    // Color(0xffc72c41), //
    // Color(0xff811236), //
    //
    // Color(0xff006fdf), //
    // Color(0xff074688), //
    //
    // Color(0xff3C70FD), //blue
    // Color(0xffF11E60), //red
    // Color(0xff8C4DE8), //purple
    // Color(0xff00c95d), //green
  ];


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
          clipper: CustomAppBarShape(),
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
        padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
        child: SingleChildScrollView(
          child: Center(
            child: Wrap(
              spacing: 5.0, // Horizontal spacing
              runSpacing: 5.0, // Vertical spacing
              alignment: WrapAlignment.center,

              children:[

                Dashboard_Container(
                    containerColor: colors[0],
                    containerText: containerDetails[0],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Attendance();
                      },));
                    },
                ),

                Dashboard_Container(
                    containerColor: colors[1],
                    containerText: containerDetails[1],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Faculty();
                      },));
                    },
                ),

                Dashboard_Container(
                    containerColor: colors[2],
                    containerText: containerDetails[2],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Notes();
                      },));
                    },
                ),

                Dashboard_Container(
                    containerColor: colors[3],
                    containerText: containerDetails[3],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return NotificationAdmin();
                      },));
                    },
                ),

                Dashboard_Container(
                    containerColor: colors[4],
                    containerText: containerDetails[4],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return PYQ();
                      },));
                    },
                ),

                Dashboard_Container(
                    containerColor: colors[5],
                    containerText: containerDetails[5],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Routine();
                      },));
                    },
                ),

                Dashboard_Container(
                    containerColor: colors[6],
                    containerText: containerDetails[6],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Society();
                      },));
                    },
                ),

              ]
            ),
          ),
        ),
      ),
    );

  }
}


//----------------Dashboard_Container-----------------
class Dashboard_Container extends StatelessWidget {
  // const Dashboard_Container({super.key});

  final double containerHeight;
  final double containerWidth;
  final Color fontColor;
  final Color containerColor;
  final String containerText;
  final Function()? containerFunction;


  Dashboard_Container({
    this.containerHeight = 100,
    this.containerWidth = 110,
    this.fontColor = Colors.white70,
    required this.containerColor,
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xffF3F9F9)),
            ),
          ),

          //-------------1st method---------------
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: Custom_Button(
                btnBgColor:  Color(0xff2F334E),
                btnTextSize: 15,
                btnName: "MANAGE",
                btnIcon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14,),
                btnWidth: 110,
                btnBorderRadius: 0,
                btnFunction: containerFunction,
              )
          ),

          //-------------2nd method---------------
          // Container(
          //     decoration: BoxDecoration(
          //         color: Color(0xff2F334E),
          //         border: Border(
          //             // top: BorderSide(color: Color(0xffF3F9F9), width: 1)
          //         ),
          //         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8), )
          //     ),
          //
          //   child: TextButton(
          //     onPressed: containerFunction,
          //     child: Row(
          //       // mainAxisSize: MainAxisSize.max,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text('MANAGE', style: TextStyle(color: Color(0xffF3F9F9)),), // Your text
          //         Padding(
          //           padding: const EdgeInsets.only(left: 1.6),
          //           child: Icon(Icons.arrow_forward_ios, color: Color(0xffF3F9F9), size: 17,),
          //         ), // Your icon
          //       ],
          //     ),
          //   ),
          // ),

//========================================
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
//     children: [Dashboard_Container()],
//   );
// },
//   itemCount: 4,
//   scrollDirection: Axis.horizontal,
// );
