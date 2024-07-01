import 'package:flutter/material.dart';
import 'package:my_first_app/views/Dateandtime.dart';
import 'package:my_first_app/views/clubs.dart';
import 'package:my_first_app/views/events.dart';
class Faculty extends StatefulWidget {
  const Faculty({super.key});

  @override
  State<Faculty> createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  bool toggle_switch = true;
  bool is_SocietyColor=true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

      



    return Scaffold(
      body: Center(
        child: Container(

          width: size.width * 1,
          height: size.height * 0.28,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                          onPressed: () {

                            setState(() {
                              is_SocietyColor=!is_SocietyColor;
                               toggle_switch=true;
                             });

                          },
                          child: Text("SOCIETY",style: TextStyle(color: is_SocietyColor?Colors.black:Colors.white,fontWeight: FontWeight.bold,)),
                          style:ElevatedButton.styleFrom(
                            backgroundColor: is_SocietyColor?Colors.white:Colors.teal ),

                      ),


                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              is_SocietyColor=!is_SocietyColor;
                              toggle_switch=false;
                            });

                          },
                          child: Text("CLUB",style: TextStyle(color: is_SocietyColor?Colors.white:Colors.black,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: is_SocietyColor?Colors.teal:Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: Container(
                        height: size.height * 0.17,
                        width: size.width * 0.60,
                        decoration: BoxDecoration(color: Colors.transparent,),
                        child:toggle_switch?Events():Clubs(),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: dateandtime(),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

