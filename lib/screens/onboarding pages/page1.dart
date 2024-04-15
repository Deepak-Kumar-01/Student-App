import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image(
            width: size.width*0.8,
              height: size.height*0.6,
              image: const AssetImage("assets/onboarding_gifs/announce.gif")
          ),
          Text("Choose Your Product",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          Text("Welcome to a World of Limitless Choices-Your Perfect Product Awaits!",style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}
