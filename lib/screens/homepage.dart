import 'package:flutter/material.dart';
import 'package:studentapp/screens/profile.dart';
import 'package:studentapp/screens/routine.dart';
import 'attendance.dart';
import 'home.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue[400],

      ),
      appBar: AppBar(
        title: Text("Home",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue[800],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
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
