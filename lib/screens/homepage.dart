import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/UserData.dart';
import 'package:studentapp/screens/admin/admin.dart';
import 'package:studentapp/screens/appbar/appbarmenu.dart';
import 'package:studentapp/screens/appbar/custom_appbar_shape.dart';
import 'package:studentapp/screens/profile.dart';
import 'package:studentapp/screens/responsiveScreens/dimensions.dart';
import 'package:studentapp/screens/routine.dart';
import 'package:studentapp/screens/settings/setting.dart';
import 'package:studentapp/services/databaseServices.dart';
import 'package:studentapp/testing/admin/adminDashboard.dart';
import '../modals/users.dart';
import '../services/secureStorage.dart';
import 'attendance.dart';
import 'home.dart';

class Homepage extends StatefulWidget {
  final studentUid;

  const Homepage({super.key, required this.studentUid});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  String? _uid;
  AppUser? _appUser;
  void init() async {
    final uid = await UserSecureStorage.getUserUID();
    setState(() {
      _uid = uid;
      print("Init State _uid:$uid}");
    });
  }

  @override
  void initState() {
    super.initState();
    init();
    // Future.delayed(Duration(seconds: 2),()=>print("App Running"));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AppUser? user = Provider.of<AppUser?>(context);
    return StreamBuilder(
        stream:DatabaseServices()
            .getUserData(_uid??"null")
            .map((snapshot) => snapshot.data()),
        builder: (context,snapshot){
          _appUser=snapshot.data;
          return Scaffold(
            appBar: AppBar(
              // toolbarHeight: 100,
              toolbarHeight: size.width <= smallDeviceWidth ? 100:130,
              // toolbarHeight: size.height*0.18,
              automaticallyImplyLeading: false,  // to disable auto menu button when using drawer
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white), // Change the color of the drawer icon here
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
            drawer: Drawer(
              backgroundColor: Colors.blue,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_appUser?.name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '${_appUser?.universityEmailId}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: const Text('Admin Login'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      // Add your onTap code here, for example navigate to another page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminDashboard()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: const Text('Admin Login'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      // Add your onTap code here, for example navigate to another page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminHomePage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      // Navigate to settings page or perform any action
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppSetting()),
                      );
                    },
                  ),
                ],
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
                NavigationDestination(icon: Icon(Icons.data_object), label: "UserData")

              ],
            ),

            body: [const Home(),const Attendance(),const Routine(),const Profile(),const UserData()][_currentIndex],

          );
        });

  }
}
