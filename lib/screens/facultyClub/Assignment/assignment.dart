import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/screens/responsiveScreens/dimensions.dart';
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
    Assignmentss('TAFL Homework', 'October 25, 2021'),
    Assignmentss('TAFL Homework', 'October 25, 2021'),
    Assignmentss('TAFL Homework', 'October 25, 2021'),

    // Add more assignments here
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width < smallDeviceWidth
        ? Container(
            // height: size.height * 0.43,
            height: 220,
            width: size.width*0.97,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "Assignments",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50.0),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Assignmentlist()),
                          );
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue[900],
                              size: 22,
                            )),
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                  color: Colors.blue[800],
                ),
                Container(
                  height: 155,
                  // color: Colors.green,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            final assignment = assignments[index];
                            return ListTile(
                              title: Text(
                                assignment.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 14),
                              ),
                              subtitle: Text('Due: ${assignment.dueDate}'),
                              trailing: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green),
                                    shape: MaterialStatePropertyAll<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ))),
                                child: const Text(
                                  'Mark as Complete',
                                  style: TextStyle(color: Colors.white,fontSize: 12),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              height: 3,
                              thickness: 2,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            height: size.height * 0.30,
            width: size.width*0.97,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "Assignments",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50.0),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Assignmentlist()),
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue[900],
                              size: 28,
                            )),
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 10,
                  thickness: 5,
                  color: Colors.blue[700],
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
                          itemBuilder: (context, index) {
                            final assignment = assignments[index];
                            return ListTile(
                              title: Text(
                                assignment.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 18),
                              ),
                              subtitle: Text('Due: ${assignment.dueDate}'),
                              trailing: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green),
                                    shape: MaterialStatePropertyAll<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ))),
                                child: const Text(
                                  'Mark as Complete',
                                  style: TextStyle(color: Colors.white,fontSize: 14),

                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              height: 10,
                              thickness: 2,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
