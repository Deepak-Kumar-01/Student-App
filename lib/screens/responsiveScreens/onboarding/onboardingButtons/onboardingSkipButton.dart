import 'package:flutter/material.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({
    super.key,
    required this.size,
    required this.lastIndex,
    required this.controller,
  });

  final Size size;
  final int lastIndex;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height * 0.09,
        left: size.width * 0.78,
        child: TextButton(
          onPressed: () {
            controller.animateToPage(lastIndex,
                duration: Duration(milliseconds: 700),
                curve: Curves.slowMiddle);
          },
          child: Text(
            "Skip",
            style: TextStyle(fontSize: 16,color: Colors.blue[900]),
          ),
        ));
  }
}
