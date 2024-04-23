import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentapp/screens/homepage.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/onboarding/onboardingController.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/signup/signupFormController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static String KEYONBOARDING = "Onboarding";
  static String KEYSIGNUP = "signup";
  static String KEYLOGIN = "login";

  void WhereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isOnboarded = sharedPref.getBool(KEYONBOARDING);
    print("${isOnboarded}");
    var isLogin=sharedPref.getBool(KEYLOGIN);
    var isSignup= sharedPref.getBool(KEYSIGNUP);

      if (isOnboarded != null) {
        if (isOnboarded) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => isLogin==true?Homepage():ResponsiveSignUp()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ResponsiveOnboarding()));
        }
      }
      else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ResponsiveOnboarding()));
      }
  }
  void initialization() async {
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    initialization();
    WhereToGo();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[800],
      //SPLASHSCREEN LOGO->JSS
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage("assets/logo/logo_2x.png"),
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
