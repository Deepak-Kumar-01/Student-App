import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../splashScreen.dart';
import '../../controllers/signup/signupFormController.dart';
class SmStartedButton extends StatelessWidget {
  const SmStartedButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.8,
      left: size.width * 0.29,
      child: ElevatedButton(
        onPressed: ()async{
          var sharedPref=await SharedPreferences.getInstance();
          sharedPref.setBool(SplashScreenState.KEYONBOARDING,true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResponsiveSignUp()));
        },
        child: Text(
          "Let's Get Started",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[900],
          shape: RoundedRectangleBorder(),
          padding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}