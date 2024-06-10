import 'package:flutter/material.dart';
class Assignmentss {
  final String title;
  final String dueDate;

  Assignmentss(this.title, this.dueDate);
}

class Assignmentlist extends StatefulWidget {
  const Assignmentlist({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Assignmentlist> {
  // Example data (you can replace this with your actual data)
  final List<Assignmentss> assignments = [
    Assignmentss('TAFL Homework', 'October 25, 2021'),
    Assignmentss('OPPs Project', 'November 15, 2021'),
    Assignmentss('DSA Homework', 'October 25, 2021'),
    Assignmentss('DBMS Homework', 'October 25, 2021'),
    Assignmentss('TAFL Homework', 'October 25, 2021'),
    Assignmentss('TAFL Homework', 'October 25, 2021'),
    Assignmentss('TAFL Homework', 'October 25, 2021'),
    Assignmentss('TAFL Homework', 'October 25, 2021'),
    Assignmentss('OPPs Project', 'November 15, 2021'),
    Assignmentss('DSA Homework', 'October 25, 2021'),
    Assignmentss('DBMS Homework', 'October 25, 2021'),
    Assignmentss('TAFL Homework', 'October 25, 2021'),
    Assignmentss('TAFL Homework', 'October 25, 2021'),
    Assignmentss('TAFL Homework', 'October 25, 2021'),

    // Add more assignments here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Assignments',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        )),
        backgroundColor: Colors.blueGrey,
    ),

      body: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          final assignment = assignments[index];
          return ListTile(
            title: Text(
              assignment.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(
              'Due: ${assignment.dueDate}',
              style: TextStyle(fontSize: 15),
            ),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Marl as Completed",
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.lightBlue),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                )),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 10, thickness: 2);
        },
      ),
    );
  }
}
