import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
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
  CustomStudent? _user;
  final String? userUid = FirebaseAuth.instance.currentUser?.uid;
  String _isOnboarded = "false";
  Future<void> initialization() async {
    print('ready in 3...');
    String? onBoardingStatus = await UserSecureStorage.getOnboarding();
    print('ready in 2...');
    setState(() {
      _isOnboarded = onBoardingStatus ?? "false";
    });
    print('ready in 1...');
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
    return StreamProvider<AppUser?>.value(
      value: DatabaseServices()
          .getUserData(userUid.toString())
          .map((snapshot) => snapshot.data()),
      initialData: null,
      child: Scaffold(
        body: Consumer<CustomStudent?>(
          builder: (context, user, child) {
            //_user is CustomStudent ref/ user at current stream
            _user = user;
            return Center(
              child: _isOnboarded != "false"
                  ? (_user?.uid == null
                      ? ResponsiveLogin()
                      : Homepage(studentUid: userUid))
                  : ResponsiveOnboarding(),
            );
          },
        ),
      ),
    );
  }
}
