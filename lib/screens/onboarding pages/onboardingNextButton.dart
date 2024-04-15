import 'package:flutter/material.dart';
class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height*0.8,
        left: size.width*0.7,
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: Colors.blue[900],minimumSize: Size(75, 75)),
          child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        ));
  }
}