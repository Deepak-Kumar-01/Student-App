import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentapp/screens/responsiveScreens/dimensions.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/nextButton/mediumDeviceNextButton.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/nextButton/smallDeviceNextButton.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/signup/signupFormController.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/pageIndicator/mediumDevicePageIndicator.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/pageIndicator/smallDevicePageIndicator.dart';
import 'package:studentapp/screens/splashScreen.dart';
import 'customPageWidget/customPageWidget.dart';
import 'getStartedButton/mediumGetStartedButton.dart';
import 'getStartedButton/smallGetStartedButton.dart';
import 'onboardingButtons/onboardingSkipButton.dart';

class OnboardingMediumDevice extends StatefulWidget {
  const OnboardingMediumDevice({super.key});
  @override
  State<OnboardingMediumDevice> createState() => _OnboardingMediumDeviceState();
}

class _OnboardingMediumDeviceState extends State<OnboardingMediumDevice> {
  int currentValue = 0;
  void onPageChange(int index) {
    setState(() {
      currentValue = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("width${size.width}");
    final pageController = PageController(
      initialPage: 0,
    );
    // print("Re-build");
    return Scaffold(
      body: Stack(children: [
        //Horizontal PageView
        PageView(
          controller: pageController,
          onPageChanged: onPageChange,
          children: [
            CustomPageWidget(
              size: size,
              image: "assets/onboarding_gifs/code.gif",
              title: "Campus Connect",
              subTitle:"Navigating Your Academic Journey with Ease and Confidence Through Comprehensive Support and Resources"
              // "Empowering Your Academic Journey",
            ),
            CustomPageWidget(
              size: size,
              image: "assets/onboarding_gifs/event_notifications.gif",
              title: "AttendEase & EventSync",
              subTitle:
              "Track Attendance and Keep Tabs on Upcoming Events with Ease",
            ),
            CustomPageWidget(
              size: size,
              image: "assets/onboarding_gifs/excited.gif",
              title: "Campus Connect",
              subTitle:
              "Building Bridges Between Students, Faculty, and Resources for Enhanced Learning and Achievement",
            ),
          ],
        ),
        //Skip Button
        OnboardingSkipButton(
            size: size, lastIndex: 3, controller: pageController),
        //Page Indicator
        currentValue < 2
            ? MediumPageIndicator(size: size, currentValue: currentValue)
            : Text(""),
        //Button
        // --------------------------------
        currentValue < 2
            ? MediumNextButton(
          size: size,
          controller: pageController,
          currentIndex: currentValue + 1,
        )
            : size.width>smallDeviceWidth?MdStartedButton(size: size):SmStartedButton(size: size),
      //   -----------------------------------------
      ]),
    );
  }
}



