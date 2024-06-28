import 'package:flutter/material.dart';

class Assignmentss {
  final String title;
  final String dueDate;
  final String url;
  final Color c1;
  
  Assignmentss(this.title, this.dueDate,this.url,this.c1);
}

class Assignmentlist extends StatefulWidget {
  const Assignmentlist({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Assignmentlist> {
  // Example data (you can replace this with your actual data)
  final List<Assignmentss> assignments = [
    Assignmentss('TAFL Homework', 'October 25, 2021','assets/images/TAFL.png',Color(0xff7ed1e6)),
    Assignmentss('OPPs Project', 'November 15, 2021','assets/images/OOPs.png',Color(0xFFfff27a)),
    Assignmentss('DSA Homework', 'October 25, 2021','assets/images/DSA.png',Color(0xffe1c0b6)),
    Assignmentss('DBMS Homework', 'October 25, 2021','assets/images/DBMS.png',Color(0xff8ec5b6)),
    Assignmentss('TAFL Homework', 'October 25, 2021','assets/images/TAFL.png',Color(0xff7ed1e6)),
    Assignmentss('TAFL Homework', 'October 25, 2021','assets/images/TAFL.png',Color(0xff7ed1e6)),
    Assignmentss('TAFL Homework', 'October 25, 2021','assets/images/TAFL.png',Color(0xff7ed1e6)),
    Assignmentss('TAFL Homework', 'October 25, 2021','assets/images/TAFL.png',Color(0xff7ed1e6)),
    Assignmentss('OPPs Project', 'November 15, 2021','assets/images/OOPs.png',Color(0xFFfff27a)),
    Assignmentss('DSA Homework', 'October 25, 2021','assets/images/DSA.png',Color(0xffe1c0b6)),
    Assignmentss('DBMS Homework', 'October 25, 2021','assets/images/DBMS.png',Color(0xff8ec5b6)),
    Assignmentss('TAFL Homework', 'October 25, 2021','assets/images/TAFL.png',Color(0xff7ed1e6)),
    Assignmentss('TAFL Homework', 'October 25, 2021','assets/images/TAFL.png',Color(0xff7ed1e6)),
    Assignmentss('TAFL Homework', 'October 25, 2021','assets/images/TAFL.png',Color(0xff7ed1e6)),

    // Add more assignments here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Assignments',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(
          color: Colors.white, // Change the back arrow color here
        ),
      ),
      body: ListView.separated(

        padding: EdgeInsets.all(4),
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
            trailing: SizedBox(
              width: 100,
              height: 33,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Mark as Completed",
                  style: TextStyle(color: Colors.white,fontSize: 10),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(0),
                  shadowColor: Colors.grey[850],
                )
              ),
            ),
            leading: SizedBox(
              height:100,
              width: 70,
              child: Image.asset(assignment.url,fit: BoxFit.cover,),
            ),
            tileColor: assignment.c1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),),
            contentPadding: EdgeInsets.all(4),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 10,thickness: 5,color: Colors.grey[700],);
        },
      ),
    );
  }
}
