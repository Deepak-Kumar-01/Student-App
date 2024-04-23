import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Schedule',
      home: UpcomingClasses_1(),
    );
  }
}

class UpcomingClasses_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Classes'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with your actual number of classes
        itemBuilder: (context, index) {
          return ClassCard(
            time: '10:00 AM', // Replace with actual class time
            instructor: 'John Doe', // Replace with actual instructor name
            progress: 0.5, // Replace with actual progress value
          );
        },
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String time;
  final String instructor;
  final double progress;

  const ClassCard({
    Key? key,
    required this.time,
    required this.instructor,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(instructor, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            LinearProgressIndicator(value: progress),
          ],
        ),
      ),
    );
  }
}
