import 'package:flutter/material.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/nextButton/smallDeviceNextButton.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/pageIndicator/smallDevicePageIndicator.dart';
import '../dimensions.dart';
import 'customPageWidget/customPageWidget.dart';
import 'getStartedButton/mediumGetStartedButton.dart';
import 'getStartedButton/smallGetStartedButton.dart';
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
      body: Container(
        // decoration: BoxDecoration(
        //   // color: Colors.blue
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       // Color(0xFF130F40),
        //       // Color(0xFF322B93),
        //       Color(0xFF0D47A1),
        //       Color(0xFF000000),
        //       // Color(0xFF0D47A1),
        //       //last pair
        //       // Color(0xff7068DE),
        //       // Color(0xff61A9D6),
        //     ]
        //   )
        // ),
        child: Stack(children: [
          //Horizontal PageView
          PageView(
            controller: pageController,
            onPageChanged: onPageChange,
            children: [
              CustomPageWidget(
                size: size,
                image: "assets/onboarding_gifs/study.gif",
                title: "Campus Connect",
                subTitle:
                "Building Bridges Between Students, Faculty, and Resources for Enhanced Learning and Achievement",
                // "Empowering Your Academic Journey",
              ),
              CustomPageWidget(
                size: size,
                image: "assets/onboarding_gifs/peace.gif",
                title: "AttendEase & EventSync",
                subTitle:
                "Track Attendance and Keep Tabs on Upcoming Events with Ease",
              ),
              CustomPageWidget(
                size: size,
                  image: "assets/onboarding_gifs/welcome.gif",
                  title: "Learning Synergy",
                subTitle:"Navigating Your Academic Journey with Ease and Confidence"

              ),
            ],
          ),
          //Skip Button
          currentValue==2?Text(""):OnboardingSkipButton(
              size: size, lastIndex: 3, controller: pageController),
          //Page Indicator
          currentValue < 3
              ? SmallPageIndicator(size: size, currentValue: currentValue)
              : Text(""),
          //Button
          currentValue <3
              ? SmallNextButton(
            size: size,
            controller: pageController,
            currentIndex: currentValue+1 ,
          )
              :Text("something went wrong!"),
        ]),
      ),
    );
  }
}
