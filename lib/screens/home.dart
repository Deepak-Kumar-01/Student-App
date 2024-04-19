import 'package:flutter/material.dart';
import 'package:studentapp/screens/upcomingclasses/schedulescreen.dart';

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
            Container(
              height: 100,
              color: Colors.green,
            ), Container(
              height: 100,
              color: Colors.blue,
            ), Container(
              height: 100,
              color: Colors.red,
            ),

            Container(
              height: 190,
              color: Colors.green,
              child: ScheduleScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
