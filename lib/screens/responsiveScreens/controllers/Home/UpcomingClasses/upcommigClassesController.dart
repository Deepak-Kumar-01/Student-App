import 'package:flutter/material.dart';
import 'package:studentapp/screens/home/upcomingclasses/upcomingclassesMediumDevice.dart';
import 'package:studentapp/screens/home/upcomingclasses/upcomingclassesSmallDevice.dart';
import 'package:studentapp/screens/responsiveScreens/dimensions.dart';
import 'package:studentapp/screens/responsiveScreens/signup/signupMediumDevice.dart';
import 'package:studentapp/screens/responsiveScreens/signup/signupSmallDevice.dart';

class ResponsiveUpcomingClasses extends StatelessWidget {
  const ResponsiveUpcomingClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > smallDeviceWidth) {
          print("Medium Screen");
          return UpcomingClassesMediumDevice();
        } else {
          print("Small Screen");
          return UpcomingClassesSmallDevice();
        }
      },
    );
  }
}
