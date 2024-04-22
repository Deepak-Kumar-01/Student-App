import 'package:flutter/material.dart';
import 'package:studentapp/screens/profile.dart';
import 'package:studentapp/screens/routine.dart';
import 'attendance.dart';
import 'home.dart';

class Homepage_1 extends StatefulWidget {
  const Homepage_1({super.key});

  @override
  State<Homepage_1> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage_1> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue[400],

      ),

      // -----------------Initial appBar ---------------------------,
      appBar: AppBar(
        title: Text("Home",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue[800],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // -----------------Initial appBar ---------------------------,

      // appBar: AppBar(
      //   toolbarHeight: 150,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   flexibleSpace: ClipPath(
      //     clipper: AppbarCustomClipper(),
      //     child: Container(
      //       height: double.infinity,
      //       color: Colors.blue,
      //       // child: Text("AppBar"),
      //     ),
      //   ),
      // ),


      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index){
          setState(() {
            _currentIndex=index;
          });
        },
        indicatorColor: Colors.blue[200],
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.calendar_month_sharp), label: "Attendance"),
          NavigationDestination(icon: Icon(Icons.receipt_outlined), label: "Routine"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      body: [const Home(),const Attendance(),const Routine(),const Profile()][_currentIndex],

    );
  }
}
