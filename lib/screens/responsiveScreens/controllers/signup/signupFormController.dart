import 'package:flutter/material.dart';
import 'package:studentapp/screens/responsiveScreens/signup/signupMediumDevice.dart';
import 'package:studentapp/screens/responsiveScreens/signup/signupSmallDevice.dart';
import '../../dimensions.dart';

class ResponsiveSignUp extends StatelessWidget {
  const ResponsiveSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > smallDeviceWidth) {
          print("Medium Screen");
          return SignUpMediumDevice();
        } else {
          print("Small Screen");
          return SignUpSmallDevice();
        }
      },
    );
  }
}
