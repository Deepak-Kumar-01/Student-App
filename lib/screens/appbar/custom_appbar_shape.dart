
import 'package:flutter/material.dart';

class CustomAppBarShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();

    // path.lineTo(0, height-50);
    // path.quadraticBezierTo(width/2, height, width, height-50);

    // path.lineTo(0, 150); // Changed starting point to move the shape 100px down
    // path.quadraticBezierTo(width / 2, 100, width, 150); // Changed control point to maintain the shape

    // path.lineTo(0, 120); // Changed starting point to move the shape 100px down
    // path.quadraticBezierTo(width / 2, 70, width, 120); // Changed control point to maintain the shape

    path.lineTo(0, 130); // Changed starting point to move the shape 100px down
    path.quadraticBezierTo(width / 2, 80, width, 130); // Changed control point to maintain the shape

    path.lineTo(width, 0);

    path.close();
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}