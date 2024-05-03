import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studentapp/screens/facultyClub/facultyClubCalendar.dart';
import 'package:studentapp/screens/home/upcomingclasses/upcomingclasses.dart';

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
           FacultyClubCalendar(),

//----------------Upcoming classes--------------------------
            Container(
              height: 190,
              color: Colors.green,
              child: UpcomingClasses(),
            ),
          ],
        ),
      ),
    );
  }
}
