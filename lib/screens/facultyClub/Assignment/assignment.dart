import 'package:flutter/material.dart';
import 'package:studentapp/screens/facultyClub/Assignment/assignmentlist.dart';

import '../../clubList/ClubList.dart';
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
    Assignmentss('TAFL Homework', 'October 25, 2021'),Assignmentss('TAFL Homework', 'October 25, 2021'),Assignmentss('TAFL Homework', 'October 25, 2021'),


    // Add more assignments here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 267,
        width: 380,
        decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(15),boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: const Offset(2,2),
              blurRadius: 5,
              spreadRadius: 1),
          const BoxShadow(
            color: Colors.grey,
            offset: Offset(-2,-2),
            blurRadius: 5,
            spreadRadius:1,
          )
        ]),
        child: Column(

          children: [
             Padding(
              padding: EdgeInsets.fromLTRB(13.0,8,0,21),
              child: Row(

                children: [
                  Text("Assignments",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  SizedBox(width: 100),
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Assignmentlist()),
                    );
                  }, child: Icon(Icons.arrow_forward_ios_rounded),
                      style: ButtonStyle(surfaceTintColor: WidgetStatePropertyAll(Colors.orange[900]),),
                  ),
                ],

              ),

            ),
            Divider(height: 10,thickness: 5,color: Colors.blueGrey,),
            SizedBox(
              height: 180,

              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:2,
                      itemBuilder: (context,index){
                        final assignment=assignments[index];
                        return ListTile(
                          title: Text(assignment.title,style: const TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text('Due: ${assignment.dueDate}'),
                          trailing:  ElevatedButton(
                            onPressed: () {

                              // Handle "Mark as Complete" button press
                              // You can add your logic here
                            },
                            style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.lightBlue),shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                )
                            )),
                            child: const Text('Mark as Complete',style: TextStyle(color: Colors.black),),
                          ),

                        );

                      },

                      separatorBuilder: (context,index) {
                        return const Divider(height: 10,thickness: 2,);
                      },

                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      );
  }
}
