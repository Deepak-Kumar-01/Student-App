import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentapp/screens/responsiveScreens/onboarding/pageIndicator/pageIndicator.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/signup/signupFormController.dart';
import 'package:studentapp/screens/splashScreen.dart';
import 'customPageWidget/customPageWidget.dart';
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
              title: "Welcome To JSS Student App",
              subTitle:
              "Welcome to a World of Limitless Choices-Your Perfect Product Awaits!",
            ),
            CustomPageWidget(
              size: size,
              image: "assets/onboarding_gifs/event_notifications.gif",
              title: "Monitor Attendance/Events and much more",
              subTitle:
              "Welcome to a World of Limitless Choices-Your Perfect Product Awaits!",
            ),
            CustomPageWidget(
              size: size,
              image: "assets/onboarding_gifs/excited.gif",
              title: "Lets Get Started",
              subTitle:
              "Welcome to a World of Limitless Choices-Your Perfect Product Awaits!",
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
            ? PageIndicator(size: size, currentValue: currentValue)
            : Text(""),
        //Button
        currentValue < 2
            ? OnboardingNextButton(
          size: size,
          controller: pageController,
          currentIndex: currentValue + 1,
        )
            : Positioned(
          top: size.height * 0.75,
          left: size.width * 0.25,
          child: ElevatedButton(
            onPressed: ()async{
              var sharedPref=await SharedPreferences.getInstance();
              sharedPref.setBool(SplashScreenState.KEYONBOARDING,true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResponsiveSignUp()));
            },
            child: Text(
              "Let's Get Started",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[900],
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.all(20),
            ),
          ),
        ),
      ]),
    );
  }
}
