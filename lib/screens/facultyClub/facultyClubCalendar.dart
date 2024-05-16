import 'package:flutter/material.dart';
import 'package:studentapp/screens/facultyClub/calendar/dateAndCalendar.dart';
import 'package:studentapp/screens/facultyClub/faculty/faculty.dart';
import 'package:studentapp/screens/facultyClub/socities/societies.dart';

class FacultyClubCalendar extends StatefulWidget {
  const FacultyClubCalendar({super.key});

  @override
  State<FacultyClubCalendar> createState() => _FacultyClubCalendarState();
}

class _FacultyClubCalendarState extends State<FacultyClubCalendar> {
  bool toggle_switch = true;
  bool is_SocietyColor = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    is_SocietyColor = !is_SocietyColor;
                    toggle_switch = true;
                  });
                },
                child: Text("SOCIETY",
                    style: TextStyle(
                        color: is_SocietyColor ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13)),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    fixedSize: Size(size.width * 0.25, 5),
                    backgroundColor:
                        is_SocietyColor ? Colors.grey[800] : Colors.grey[300]),
              ),
               SizedBox(
                 width: 10,
               ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    is_SocietyColor = !is_SocietyColor;
                    toggle_switch = false;
                  });
                },
                child: Text(
                  "FACULTY",
                  style: TextStyle(
                      color: is_SocietyColor ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 0),
                    fixedSize: Size(size.width * 0.25, 5),
                    backgroundColor:
                        is_SocietyColor ? Colors.grey[300] : Colors.grey[800]),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                is_SocietyColor ? Socities() : Faculty(),
                DateAndCalendar(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
