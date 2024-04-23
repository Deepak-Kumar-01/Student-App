import 'package:flutter/material.dart';

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
      child: Column(
        children: [
          Container(
            color: Colors.teal,
            child: Image(
                width: size.width * 0.6,
                height: size.height * 0.6,
                image: AssetImage(image)),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: size.width*0.8,
            child: Text(
              subTitle,
              style: TextStyle(fontSize: 16,),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
