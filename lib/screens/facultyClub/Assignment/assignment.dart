import 'package:flutter/material.dart';
import '../../clubList/ClubList.dart';
import 'assignmentlist.dart';
class Assignmentss {
  final String title;
  final String dueDate;

  Assignmentss(this.title, this.dueDate);
}
class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  final List<Assignmentss> assignments = [
    Assignmentss('TAFL Homework', 'October 25, 2021'),
    Assignmentss('OPPs Project', 'November 15, 2021'),
    Assignmentss('DSA Homework', 'October 25, 2021'),
    Assignmentss('DBMS Homework', 'October 25, 2021'),

    // Add more assignments here
  ];

  @override
  Widget build(BuildContext context) {
        child: Column(
          children: [
             ,
                ],
              ),
            ),
            SizedBox(
              height: 188,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context,index){
                        final assignment=assignments[index];
                        return ListTile(
                          subtitle: Text('Due: ${assignment.dueDate}'),
                          trailing:  ElevatedButton(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                          ),
                        );
                      },
                      separatorBuilder: (context,index) {
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
  }
}
