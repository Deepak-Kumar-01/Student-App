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
          //Medium Device
          //   width: size.width * 0.6,
          //   height: size.height * 0.6,
          //Small Device
            width: size.width * 0.9,
            height: size.height * 0.5,
            image: AssetImage(image)),
        Positioned(
          //large device
          // top: size.height*0.49,
          //small device
          top:size.height*0.48,
            child: Column(
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: Text(
                title,
                style: size.width>smallDeviceWidth?const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ):const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width>smallDeviceWidth?size.width * 0.8:size.width * 0.8,
              child: Text(
                subTitle,
                style: size.width>smallDeviceWidth?const TextStyle(
                  fontSize: 19,
                  color: Colors.black
                ):const TextStyle(
                  fontSize: 14,
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
