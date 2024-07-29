import 'package:flutter/material.dart';

import '../../../../services/secureStorage.dart';
import '../../../../wrapper.dart';

class MediumNextButton extends StatelessWidget {
  MediumNextButton({
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
        // top: size.height * 0.79,
        // left: size.width * 0.7,
        top: size.height*0.8,
        left: size.width * 0.20,
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
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.blue[900],
              minimumSize: Size(size.width*0.6, 65)
          ),
          // child: Icon(
          //   Icons.arrow_forward_ios,
          //   color: Colors.white,
          // ),
          child: currentIndex<3?Text("Continue",style: TextStyle(color: Colors.white,fontSize: 22),):InkWell(
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
            child:Text("Let's Start",style: TextStyle(color: Colors.white,fontSize: 22),) ,
          ),
        ));
  }
}
