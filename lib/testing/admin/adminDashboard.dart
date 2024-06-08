import 'package:flutter/material.dart';
import 'package:studentapp/screens/admin/admin.dart';
import 'package:studentapp/screens/responsiveScreens/dimensions.dart';
import 'package:studentapp/testing/admin/adminScreens/adminAttendance.dart';
import 'package:studentapp/testing/admin/adminScreens/adminFaculty.dart';
import 'package:studentapp/testing/admin/adminScreens/adminRoutine.dart';

import '../../screens/appbar/appbarmenu.dart';
import '../../screens/appbar/custom_appbar_shape.dart';

import 'package:studentapp/screens/admin/Student.dart';

import '../../screens/attendance.dart';
import '../../screens/custombutton/custom_button.dart';
import '../../screens/facultyClub/faculty/faculty.dart';
import '../../screens/routine.dart';
import 'adminScreens/adminNotes.dart';
import 'adminScreens/adminPYQ.dart';
import 'adminScreens/adminSociety.dart';
import 'adminScreens/adminNotificationAdmin.dart';

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
    "Student",
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
      // drawer: Drawer(
      //   backgroundColor: Colors.blue,
      // ),

      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 4, right: 4),
        child: SingleChildScrollView(
          child: Center(
            child: Wrap(
                spacing: 5.0, // Horizontal spacing
                runSpacing: 5.0, // Vertical spacing
                alignment: WrapAlignment.center,
                children: [

                  Dashboard_Container(
                    containerColor: colors[7],
                    containerText: containerDetails[7],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Student();
                        },
                      ));
                    },
                  ),

                  Dashboard_Container(
                    containerColor: colors[0],
                    containerText: containerDetails[0],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AdminAttendance();
                        },
                      ));
                    },
                  ),
                  Dashboard_Container(
                    containerColor: colors[1],
                    containerText: containerDetails[1],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AdminFaculty();
                        },
                      ));
                    },
                  ),
                  Dashboard_Container(
                    containerColor: colors[2],
                    containerText: containerDetails[2],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AdminNotes();
                        },
                      ));
                    },
                  ),
                  Dashboard_Container(
                    containerColor: colors[3],
                    containerText: containerDetails[3],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AdminNotification();
                        },
                      ));
                    },
                  ),
                  Dashboard_Container(
                    containerColor: colors[4],
                    containerText: containerDetails[4],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AdminPYQ();
                        },
                      ));
                    },
                  ),
                  Dashboard_Container(
                    containerColor: colors[5],
                    containerText: containerDetails[5],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AdminRoutine();
                        },
                      ));
                    },
                  ),
                  Dashboard_Container(
                    containerColor: colors[6],
                    containerText: containerDetails[6],
                    containerFunction: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AdminSociety();
                        },
                      ));
                    },
                  ),

                ]),
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
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8),),
        // border: Border.all(
        //   color: Colors.black,
        //   width: 1.3,
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              containerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffF3F9F9)),
            ),
          ),

          ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8)
              ),
              child: Custom_Button(
                btnBgColor: Color(0xff2F334E),
                btnTextSize: 15,
                btnName: "MANAGE",
                btnIcon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 14,
                ),
                btnWidth: 110,
                btnBorderRadius: 0,
                btnFunction: containerFunction,
              )
          ),
        ],
      ),
    );
  }
}
