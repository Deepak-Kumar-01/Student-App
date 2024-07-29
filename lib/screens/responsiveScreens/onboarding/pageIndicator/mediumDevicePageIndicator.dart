import 'package:flutter/material.dart';

class MediumPageIndicator extends StatelessWidget {
  const MediumPageIndicator({
    super.key,
    required this.size,
    required this.currentValue,
  });

  final Size size;
  final int currentValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: size.height * 0.83,
      // left: size.width * 0.1,
      top: size.height*0.72,
      left: size.width*0.34,
      child: Row(
          children: List.generate(
              3,
                  //index->0/1/2
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  width: index == currentValue ? 55 : 25,
                  height: 10,
                  decoration: BoxDecoration(
                    // color: Colors.pinkAccent,
                      color: index == currentValue
                          ? Colors.blue[900]
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ))),
    );
  }
}
