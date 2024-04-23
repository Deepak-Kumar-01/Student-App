import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/nextButton/mediumDeviceNextButton.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/nextButton/smallDeviceNextButton.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/pageIndicator/mediumDevicePageIndicator.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/pageIndicator/pageIndicator.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/signup/signupFormController.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/pageIndicator/smallDevicePageIndicator.dart';
import 'package:studentapp/screens/splashScreen.dart';
import '../dimensions.dart';
import 'customPageWidget/customPageWidget.dart';
import 'getStartedButton/mediumGetStartedButton.dart';
import 'getStartedButton/smallGetStartedButton.dart';
import 'onboardingButtons/onboardingNextButton.dart';
import 'onboardingButtons/onboardingSkipButton.dart';


class OnboardingSmallDevice extends StatefulWidget {
  const OnboardingSmallDevice({super.key});
  @override
  State<OnboardingSmallDevice> createState() => _OnboardingSmallDeviceState();
}

class _OnboardingSmallDeviceState extends State<OnboardingSmallDevice> {
  int currentValue = 0;
  void onPageChange(int index) {
    setState(() {
      currentValue = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("${size.width}");
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
                title: "Academic Odyssey",
                subTitle:"Navigating Your Academic Journey with Ease and Confidence Through Comprehensive Support and Resources"
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
            // SignUp()
            // MyAuth(isLoginClicked: true,),
          ],
        ),
        //Skip Button
        OnboardingSkipButton(
            size: size, lastIndex: 3, controller: pageController),
        //Page Indicator
        currentValue < 2
            ? SmallPageIndicator(size: size, currentValue: currentValue)
            : Text(""),
        //Button
        currentValue < 2
            ? SmallNextButton(
          size: size,
          controller: pageController,
          currentIndex: currentValue + 1,
        )
            : size.width>smallDeviceWidth?MdStartedButton(size: size):SmStartedButton(size: size),
      ]),
    );
  }
}
