import 'package:flutter/material.dart';
import 'package:studentapp/screens/responsiveScreens/dimensions.dart';

class CustomPageWidget extends StatelessWidget {
  const CustomPageWidget({
    super.key,
    required this.size,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final Size size;
  final String title, subTitle, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(alignment: Alignment.topCenter, children: [
        Image(
            width: size.width * 0.6,
            height: size.height * 0.6,
            image: AssetImage(image)),
        Positioned(
          top: size.height*0.49,
            child: Column(
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: Text(
                title,
                style: size.width>smallDeviceWidth?TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ):TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Text(
                subTitle,
                style: size.width>smallDeviceWidth?TextStyle(
                  fontSize: 19,
                ):TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
