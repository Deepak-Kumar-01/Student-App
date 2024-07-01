import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studentapp/screens/Routine/timetable_api.dart';

import '../../modals/timetableModal.dart';

DateTime dateTime = DateTime.now();

// Selected day for routine display
String selectedDay = DateFormat("EEEE").format(dateTime).toLowerCase();
String dayName = DateFormat("EEEE").format(dateTime).toLowerCase();
int dayIndex=0;

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {

  // Generate a list of the next 5 days including the current date
  List<DateTime> nextDays = List.generate(7, (index) {
    return dateTime.add(Duration(days: index));
  });

  @override
  Widget build(BuildContext context) {
    // dateTime = DateTime.now();

    return Scaffold(
      body: StreamBuilder<MCA>(
        stream: MCAService().getMCADataStream(),
    builder: (context, AsyncSnapshot<MCA> snapshot){
      if (snapshot.hasError) {
        print('Error: ${snapshot.error}');
        return Text('Error: ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }

      MCA? mca = snapshot.data;

      if (mca == null || mca.semesters.isEmpty) {
        return Center(child: Text('No timetable data available.'));
      }

      return  Column(
        children: [
          // ================ Date and weekday ===================
          Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: Container(
              height: 65,
              width: double.infinity,
              alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nextDays.length,
                itemBuilder: (context, index) {
                  DateTime day = nextDays[index]; // current DateTime details
                  dayName = DateFormat("EEEE").format(day).toLowerCase(); // current day name

                  return InkWell(
                    onTap: () {
                      print("${DateFormat("EEEE").format(day)}");
                      setState(() {
                        selectedDay =
                            DateFormat("EEEE").format(day).toLowerCase();
                        dayIndex=index;
                        print("index:${dayIndex}");
                      });
                    },
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                          color: selectedDay == dayName
                              ? Colors.blueAccent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${DateFormat("dd").format(day)}",
                            style: TextStyle(
                                fontSize: 18,
                                color: selectedDay == dayName
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Text(
                            "${DateFormat("E").format(day).toUpperCase()}",
                            style: TextStyle(
                                fontSize: 10,
                                // fontWeight: FontWeight.w600,
                                color: selectedDay == dayName
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          //================ RoutineDetails ==================
          Expanded(
            child: Container(
              // height: 200,
              decoration: BoxDecoration(
                color: Color(0xFFE5E5EC),
              ),

              child: dayIndex ==6
                  ? Container(
                height: 100,
                color: Colors.blueAccent,
                child: Image.asset(
                  'assets/images/lazyPanda.jpg',
                  fit: BoxFit.cover,
                ),
              )
                  : ListView.builder(
                // itemCount: routineapi[selectedDay]?.length,
                itemCount: mca.semesters[0].timetable[dayIndex].slots.length,
                itemBuilder: (context, index) {
                  var slot=mca.semesters[0].timetable[dayIndex].slots[index];
                  var subjectTime =slot.time;
                  var subjectCode=slot.subCode;
                  var subjectName=slot.subject;
                  var subjectTeacher=slot.faculty;

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: ListTile(
                            leading: Text(
                              subjectTime!,
                              style: TextStyle(fontSize: 12),
                            ),
                            title: Text(
                              "$subjectName ($subjectCode)",
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(subjectTeacher!,
                                style:
                                TextStyle(color: Color(0xFF5E5E5E))),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      );
    }),
    //   body: Column(
    //   children: [
    //     // ================ Date and weekday ===================
    //     Padding(
    //       padding: const EdgeInsets.only(left: 5,right: 5),
    //       child: Container(
    //         height: 65,
    //         width: double.infinity,
    //         alignment: Alignment.center,
    //         child: ListView.builder(
    //           scrollDirection: Axis.horizontal,
    //           itemCount: nextDays.length,
    //           itemBuilder: (context, index) {
    //             DateTime day = nextDays[index]; // current DateTime details
    //             dayName = DateFormat("EEEE").format(day).toLowerCase(); // current day name
    //
    //             return InkWell(
    //               onTap: () {
    //                 print("${DateFormat("EEEE").format(day)}");
    //                 setState(() {
    //                   selectedDay =
    //                       DateFormat("EEEE").format(day).toLowerCase();
    //                 });
    //               },
    //               child: Container(
    //                 width: 50,
    //                 decoration: BoxDecoration(
    //                     color: selectedDay == dayName
    //                         ? Colors.blueAccent
    //                         : Colors.white,
    //                     borderRadius: BorderRadius.circular(15)),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Text(
    //                       "${DateFormat("dd").format(day)}",
    //                       style: TextStyle(
    //                           fontSize: 18,
    //                           color: selectedDay == dayName
    //                               ? Colors.white
    //                               : Colors.black),
    //                     ),
    //                     Text(
    //                       "${DateFormat("E").format(day).toUpperCase()}",
    //                       style: TextStyle(
    //                           fontSize: 10,
    //                           // fontWeight: FontWeight.w600,
    //                           color: selectedDay == dayName
    //                               ? Colors.white
    //                               : Colors.black),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ),
    //
    //     //================ RoutineDetails ==================
    //     Expanded(
    //       child: Container(
    //         // height: 200,
    //         decoration: BoxDecoration(
    //           color: Color(0xFFE5E5EC),
    //         ),
    //
    //         child: selectedDay == "sunday"
    //             ? Container(
    //           height: 100,
    //           color: Colors.blueAccent,
    //           child: Image.asset(
    //             'assets/images/lazyPanda.jpg',
    //             fit: BoxFit.cover,
    //           ),
    //         )
    //             : ListView.builder(
    //           itemCount: routineapi[selectedDay]?.length,
    //           itemBuilder: (context, index) {
    //             var subjectTime =
    //             routineapi[selectedDay]?[index]["time"];
    //             var subjectCode =
    //             routineapi[selectedDay]?[index]["subjectCode"];
    //             var subjectName =
    //             routineapi[selectedDay]?[index]["subjectName"];
    //             var subjectTeacher =
    //             routineapi[selectedDay]?[index]["subjectTeacher"];
    //
    //             return Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(
    //                       left: 0, right: 0, top: 0, bottom: 5),
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(6),
    //                     ),
    //                     child: ListTile(
    //                       leading: Text(
    //                         subjectTime!,
    //                         style: TextStyle(fontSize: 12),
    //                       ),
    //                       title: Text(
    //                         "$subjectName ($subjectCode)",
    //                         style:
    //                         TextStyle(fontWeight: FontWeight.bold),
    //                       ),
    //                       subtitle: Text(subjectTeacher!,
    //                           style:
    //                           TextStyle(color: Color(0xFF5E5E5E))),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             );
    //           },
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    );
  }
}
