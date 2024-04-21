import 'package:flutter/material.dart';
import 'package:studentapp/screens/responsiveScreens/login/loginMediumDevice.dart';
import 'package:studentapp/screens/responsiveScreens/login/loginSmallDevice.dart';
import '../../dimensions.dart';

class ResponsiveLogin extends StatelessWidget {
  const ResponsiveLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > smallDeviceWidth) {
          return LoginMediumDevice();
        } else {
          return LoginSmallDevice();
        }
      },
    );
  }
}
