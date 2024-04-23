import 'package:flutter/material.dart';

class SmallNextButton extends StatelessWidget {
  SmallNextButton({
    super.key,
    required this.size,
    required this.controller,
    required this.currentIndex,
  });

  final Size size;
  final controller;
  int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height * 0.81,
        left: size.width * 0.68,
        child: ElevatedButton(
          onPressed: () {
            print("Working inside button widget $currentIndex");
            // controller.jumpToPage(currentIndex);
            controller.animateToPage(
                currentIndex,
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOutSine);
          },
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Colors.blue[900],
              minimumSize: Size(60, 60)),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ));
  }
}
