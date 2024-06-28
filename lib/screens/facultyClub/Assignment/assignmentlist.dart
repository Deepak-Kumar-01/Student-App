import 'package:flutter/material.dart';

class Assignmentss {
  final String title;
  final String dueDate;
  final String url;

}

class Assignmentlist extends StatefulWidget {
  const Assignmentlist({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Assignmentlist> {
  // Example data (you can replace this with your actual data)
  final List<Assignmentss> assignments = [

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
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Mark as Completed",
                  style: TextStyle(color: Colors.white,fontSize: 10),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(0),
                )
              ),
            ),
            leading: SizedBox(
              height:100,
              width: 70,
              child: Image.asset(assignment.url,fit: BoxFit.cover,),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
        },
      ),
    );
  }
}
