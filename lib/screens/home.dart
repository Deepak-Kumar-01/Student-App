import 'package:flutter/material.dart';
import 'package:studentapp/screens/facultyClub/Assignment/assignment.dart';
import 'package:studentapp/screens/facultyClub/facultyClubCalendar.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/Home/UpcomingClasses/upcommigClassesController.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(

        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

//--------------------------------------
            Padding(
              padding: EdgeInsets.only(
                left: 60, right: 60, top: 0, bottom: 0
              ),
              child: Container(
                height: 100,
                color: Colors.green,
              ),
            ),

//--------------Society and faculty------------------------
          Assignment(),
          SizedBox(height: 50,),
//----------------Upcoming classes--------------------------
            Container(
              height: 200,  // this height control its child widget height
              color: Colors.green,
              child: ResponsiveUpcomingClasses(),
            ),
          ],
        ),
      ),
    );
  }
}
