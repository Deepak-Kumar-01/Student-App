import 'package:flutter/material.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height * 0.09,
        left: size.width * 0.78,
        child: TextButton(
          onPressed: () {},
          child: const Text(
            "Skip",
            style: TextStyle(fontSize: 18),
          ),
        ));
  }
}