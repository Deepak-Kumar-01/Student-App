import 'package:flutter/material.dart';

class SmallPageIndicator extends StatelessWidget {
  const SmallPageIndicator({
    super.key,
    required this.size,
    required this.currentValue,
  });

  final Size size;
  final int currentValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height*0.68,
      left: size.width*0.34,
      child: Row(
          children: List.generate(
              3,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: index == currentValue ? 50 : 25,
                      height: 9,
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
