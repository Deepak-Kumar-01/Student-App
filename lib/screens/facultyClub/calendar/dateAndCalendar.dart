import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAndCalendar extends StatefulWidget {
  const DateAndCalendar({super.key});

  @override
  State<DateAndCalendar> createState() => _DateAndCalendarState();
}

class _DateAndCalendarState extends State<DateAndCalendar> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String months = new DateFormat('MMM').format(selectedDate);
    String years = new DateFormat('y').format(selectedDate);
    String days = new DateFormat('d').format(selectedDate);
    String weeks = new DateFormat('EEEE').format(selectedDate);
    return Column(
      children: [
        Container(
          height: size.height * 0.066,
          width: size.width * 0.30,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                months,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                years,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2025));
            if (pickedDate != null) {
              setState(() {
                selectedDate = pickedDate;
              });
            };
          },
          

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${days} ",
                style: TextStyle(fontSize:21,color: Colors.white),
              ),
              Text(
                "${weeks} ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize:12,color: Colors.white),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(size.width*0.30, size.height*0.13),
            padding: EdgeInsets.all(5),
            backgroundColor: Colors.grey.shade900,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
