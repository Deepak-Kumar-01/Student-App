import 'package:flutter/material.dart';
import 'package:studentapp/screens/responsiveScreens/dimensions.dart';

class Assignmentss {
  final String title;
  final String dueDate;
  final String url;
  final Color c1;

  Assignmentss(this.title, this.dueDate, this.url, this.c1);
}

class Assignmentlist extends StatefulWidget {
  const Assignmentlist({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Assignmentlist> {
  // Example data (you can replace this with your actual data)
  final List<Assignmentss> assignments = [
    Assignmentss('TAFL Homework', 'October 25, 2021',
        'assets/images/autmata.png', Color(0xffff7f3e)),
    Assignmentss('OPPs Project', 'November 15, 2021', 'assets/images/Java.png',
        Color(0xFF7aa2e3)),
    Assignmentss('DSA Homework', 'October 25, 2021', 'assets/images/os.png',
        Color(0xff36ba98)),
    Assignmentss('DBMS Homework', 'October 25, 2021', 'assets/images/dbms.png',
        Color(0xff7071e8)),
    Assignmentss('OS Homework', 'October 25, 2021', 'assets/images/autmata.png',
        Color(0xffff6969)),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Assignments',
          style: TextStyle( fontSize:size.width>smallDeviceWidth? 26:22, color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the back arrow color here
        ),
      ),
      body: size.width > smallDeviceWidth
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                childAspectRatio: 2.5 / 3,
                // Number of columns
              ),
              padding: const EdgeInsets.fromLTRB(8, 30, 8, 0),
              scrollDirection: Axis.vertical,
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                final assignment = assignments[index];
                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Ink.image(
                        image: AssetImage(assignment.url),
                        height: 50,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              assignment.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Due: ${assignment.dueDate}',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, top: 25, right: 12),
                              child: SizedBox(
                                width: 140,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: EdgeInsets.all(5),
                                      shadowColor: Colors.grey[850],
                                    ),
                                    child: Text(
                                      "Mark as Completed",
                                      style: TextStyle(
                                          color: assignment.c1, fontSize: 12),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //leading: SizedBox(
                    // height:100,
                    //width: 40,
                    //child: Image.asset(assignment.url,fit: BoxFit.cover,),
                    //),
                    tileColor: assignment.c1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.all(4),
                  ),
                );
              },
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                childAspectRatio: 2.5 / 3,
                // Number of columns
              ),
              padding: const EdgeInsets.fromLTRB(8, 30, 8, 0),
              scrollDirection: Axis.vertical,
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                final assignment = assignments[index];
                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Ink.image(
                        image: AssetImage(assignment.url),
                        height: 50,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              assignment.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Due: ${assignment.dueDate}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, top: 25, right: 12),
                              child: SizedBox(
                                width: 120,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: EdgeInsets.all(5),
                                      shadowColor: Colors.grey[850],
                                    ),
                                    child: Text(
                                      "Mark as Completed",
                                      style: TextStyle(
                                          color: assignment.c1, fontSize: 10),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //leading: SizedBox(
                    // height:100,
                    //width: 40,
                    //child: Image.asset(assignment.url,fit: BoxFit.cover,),
                    //),
                    tileColor: assignment.c1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.all(4),
                  ),
                );
              },
            ),
    );
  }
}
