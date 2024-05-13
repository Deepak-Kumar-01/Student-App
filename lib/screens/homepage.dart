import 'package:flutter/material.dart';
import 'package:studentapp/screens/appbar/appbarmenu.dart';
import 'package:studentapp/screens/appbar/custom_appbar_shape.dart';
import 'package:studentapp/screens/profile.dart';
import 'package:studentapp/screens/responsiveScreens/dimensions.dart';
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
    final size=MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue,
      ),

      appBar: AppBar(
        // toolbarHeight: 100,
        // toolbarHeight: 130,
        toolbarHeight: size.width <= smallDeviceWidth ? 130:130,
        // toolbarHeight: size.height*0.18,
        automaticallyImplyLeading: false,  // to disable auto menu button when using drawer
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white), // Change the color of the drawer icon here
        shadowColor: Colors.transparent,
        excludeHeaderSemantics: true,
        elevation: 0.0,
        forceMaterialTransparency: true,
        centerTitle: true,

        flexibleSpace: ClipPath(
          clipper: CustomAppBarShape(), //<<<===
          child: Container(
            // // height: 150,
            // width: MediaQuery.of(context).size.width,
            color: Colors.blue[700],

            //======AppBar Menu======
            child: AppBarMenu(),
          ),
        ),
      ),


// ==================Footer======================
      bottomNavigationBar: NavigationBar(
        height: 70,
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
