import 'package:flutter/material.dart';

import '../../../../services/secureStorage.dart';
import '../../../../wrapper.dart';

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
        top: size.height * 0.8,
        left: size.width * 0.21,
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
            backgroundColor: Colors.blue[900],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(12),
              minimumSize: Size(size.width*0.6, 50)

          ),
          child: currentIndex<3?const Text(
            "Continue",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ):InkWell(
            onTap: ()async{
              showDialog(
                  context: context,
                  builder: (context){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue[900],
                      ),
                    );
                  });
              await UserSecureStorage.setOnboarding("true");
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>Wrapper()),
                    (Route<dynamic> route) => false,
              );
            },
            child: const Text(
              "Let's Begin",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ));
  }
}
