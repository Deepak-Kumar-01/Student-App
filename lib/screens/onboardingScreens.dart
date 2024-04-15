import 'package:flutter/material.dart';
import 'onboarding pages/customPageWidget.dart';
import 'onboarding pages/onboardingNextButton.dart';
import 'onboarding pages/onboardingSkipButton.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pageController = PageController(
      initialPage: 0,
    );
    return Scaffold(
      body: Stack(children: [
        //Horizontal PageView
        PageView(
          controller: pageController,
          children: [
            CustomPageWidget(
              size: size,
              image: "assets/onboarding_gifs/code.gif",
              title: "Choose Your Product",
              subTitle:
                  "Welcome to a World of Limitless Choices-Your Perfect Product Awaits!",
            ),
            CustomPageWidget(
              size: size,
              image: "assets/onboarding_gifs/event_notifications.gif",
              title: "Choose Your Product",
              subTitle:
                  "Welcome to a World of Limitless Choices-Your Perfect Product Awaits!",
            ),
            CustomPageWidget(
              size: size,
              image: "assets/onboarding_gifs/excited.gif",
              title: "Choose Your Product",
              subTitle:
                  "Welcome to a World of Limitless Choices-Your Perfect Product Awaits!",
            ),
          ],
        ),
        //Skip Button
        OnboardingSkipButton(size: size),
        //Page Indicator

        //Button
        OnboardingNextButton(size: size)
      ]),
    );
  }
}




