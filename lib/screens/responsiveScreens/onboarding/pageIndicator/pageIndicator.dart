import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.size,
    required this.currentValue,
  });

  final Size size;
  final int currentValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.83,
      left: size.width * 0.1,
      child: Row(
          children: List.generate(
              3,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: index == currentValue ? 55 : 25,
                      height: 14,
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
