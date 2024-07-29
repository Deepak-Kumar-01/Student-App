import 'package:flutter/material.dart';
import 'package:studentapp/screens/facultyClub/Assignment/assignment.dart';
import 'package:studentapp/screens/facultyClub/facultyClubCalendar.dart';
import 'package:studentapp/screens/home/CarouseSlider/carouselSlider.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/Home/UpcomingClasses/upcommigClassesController.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Colors.white,
      alignment: Alignment.center,
      child: SingleChildScrollView(

        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

//--------------------------------------
            CarouselSlider(),

//--------------Society and faculty------------------------
          Assignment(),
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
