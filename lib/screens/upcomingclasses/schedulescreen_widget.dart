import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleScreen_Widget extends StatelessWidget {
  // const ScheduleScreen_Widget({super.key});

  var studentAttendance = [100, 66, 75, 98];

  var scheduleList = [
    {
      "subjectShortForm": "TAFL",
      "subjectTeacher": "Janeet Kaur",
    },
    {
      "subjectShortForm": "OOPs",
      "subjectTeacher": "Shobha G",
    },
    {
      "subjectShortForm": "OS",
      "subjectTeacher": "Abha Sharma",
    },
    {
      "subjectShortForm": "DBMS",
      "subjectTeacher": "Megha Gupta",
    },
  ];


  Color whiteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(
        children: [

          Padding(
          padding: const EdgeInsets.only(left: 2, right: 2),
          child: Card(
            elevation: 11,
            shadowColor: Colors.black,
            child: Stack(
              children: [
            // ----------------------------------
                Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff61A9D6),
                      Color(0xff7068DE)
                    ]
                  ),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
            
                    var subjectShortForm = scheduleList[index]["subjectShortForm"];
                    var subjectTeacher = scheduleList[index]["subjectTeacher"];
                    var subjectAttendance = studentAttendance[index];
            
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color:  subjectAttendance >= 75 ? Colors.green[700] : Colors.red,
                                  ),
                                  child: Container(
                                    width: 90,
                                    height: 90,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("$subjectShortForm", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("$subjectTeacher", style: TextStyle(fontSize: 12),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
            
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                child: Text("8:45 AM", style: TextStyle(color: whiteColor,  fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: subjectAttendance>=75 ?
                                    [Color(0xff02BC84), Color(0xff32948b),] :
                                    [Color(0xffea4eb6), Color(0xffd73b3b),]
                                  ),
                                  borderRadius: BorderRadius.circular(6)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
                                  child: Text("$subjectAttendance%", style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold, ),),
                                ),
                              )
                            ],
                          ),
            
                        ],
                      ),
                    );
                  },
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              ]
            ),
          ),
        ),

          //---------------Upcoming classes------------
          Positioned(
            left: 2,
            top: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                      colors: [
                        Color(0xffD973B7),
                        Color(0xff5656B8)
                      ]
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                child: Text("UPCOMING CLASSES", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            ),
          ),

        ]
      ),

    );
  }
}

//--------------Initial code--------------------
//Stack(
//         children: [
//
//           Padding(
//           padding: const EdgeInsets.all(11.0),
//           child: Stack(
//             children: [
//           // ----------------------------------
//               Container(
//               width: double.infinity,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(15)
//               ),
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   return Row(
//                     children: [
//
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           width: 100,
//                           height: 100,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             color:  Colors.red,
//                           ),
//                           child: Container(
//                             width: 90,
//                             height: 90,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               color: Colors.white,
//                             ),
//                             child: Text("COA"),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//                 itemCount: 15,
//                 scrollDirection: Axis.horizontal,
//               ),
//             ),
//             ]
//           ),
//         ),
//           //----------------------------------
//           Positioned(
//             left: 5,
//             top: 5,
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   gradient: LinearGradient(
//                       colors: [
//                         Color(0xffD973B7),
//                         Color(0xff5656B8)
//                       ]
//                   )
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text("UPCOMING CLASSES", style: TextStyle(color: Colors.white,),),
//               ),
//             ),
//           ),
//
//         ]
//       ),



          //  -----------Upcoming classes-------------------
          // Container(
          //     child: Container(
          //       decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //           colors: [
          //             Color(0xffD973B7),
          //             Color(0xff5656B8)
          //           ]
          //         )
          //       ),
          //       child: Text("UPCOMING CLASSES", style: TextStyle(color: Colors.white,),),
          //     ),
          //   ),