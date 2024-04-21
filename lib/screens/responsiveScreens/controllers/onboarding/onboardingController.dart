import 'package:flutter/material.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/onboardingMediumDevice.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/onboardingSmallDevice.dart';
import '../../dimensions.dart';

class ResponsiveOnboarding extends StatelessWidget {
  const ResponsiveOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > smallDeviceWidth) {
          return OnboardingMediumDevice();
        } else {
          return OnboardingSmallDevice();
        }
      },
    );
  }
}
