import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/providers/authProvider.dart';
import 'package:studentapp/screens/homepage.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/login/loginFormController.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/onboarding/onboardingController.dart';
import 'package:studentapp/services/databaseServices.dart';
import 'package:studentapp/services/secureStorage.dart';
import 'modals/authStudent.dart';
import 'modals/users.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String? userUid;
  String _isOnboarded = "false";

  Future<void> initialization() async {
    print('ready in 3...');
    String? onBoardingStatus = await UserSecureStorage.getOnboarding();
    print('ready in 2...');
    setState(() {
      _isOnboarded = onBoardingStatus ?? "false";
    });
    print('ready in 1...');
    userUid=await UserSecureStorage.getUserUID();
    print(userUid);
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<MyAuthProvider?>(context);
    // print("Inside Wrapper:${authProvider?.user}");
    return Scaffold(
          body:Center(
              child: _isOnboarded != "false"
                  ? (authProvider?.user?.uid == null
                      ? const ResponsiveLogin()
                      : const Homepage())
                  : const ResponsiveOnboarding(),
            )
    );
  }
}
