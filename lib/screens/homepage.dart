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
import '../providers/authProvider.dart';
import '../services/authentication.dart';
import '../services/secureStorage.dart';
import '../wrapper.dart';
import 'attendance.dart';
import 'home.dart';

class Homepage extends StatefulWidget {

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authProvider = Provider.of<MyAuthProvider?>(context);
    AppUser? userData=authProvider?.appUser;
    // print("APPUSER DATA Inside Homepage:${userData?.toJson()}");
    double toolbarHeight;
    if (size.height <= 640) {
      // Small screen
      toolbarHeight = 108;
    } else if (size.height <= 731) {
      // Medium screen
      toolbarHeight = 105;
    } else {
      // Large screen
      toolbarHeight = 100;
    }
    return Scaffold(
            appBar: AppBar(
              // toolbarHeight: 100,
              toolbarHeight: toolbarHeight,
              // toolbarHeight: size.width <= smallDeviceWidth ? 100:130,
//               toolbarHeight: size.width <= smallDeviceWidth ? 108:130,
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
                  color: Colors.blue[800],

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
                          '${userData?.name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '${userData?.universityEmailId}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${userData?.role}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
              userData?.role!="student"?ListTile(
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
              ):Text(""),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Logout'),
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.blue[900],
                                ),
                              );
                            });
                        // await _authRef.signOutUser();
                        await authProvider!.signOut();
                        await UserSecureStorage.setUserUID("null");
                        if(mounted){
                          Navigator.of(context).pop();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) =>Wrapper()),
                                (Route<dynamic> route) => false,
                          );
                        }
                      },
                  ),
                ],
              ),
            ),


// ==================Footer======================
            bottomNavigationBar: Container(
              height: 70,
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)
                ),
                child: Column(
                  children: [
                    Container(
                      height: 3,
                      color: Colors.blue,
                    ),
                    NavigationBar(
                      height: 67,
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
                  ],
                ),
              ),
            ),

            body: [const Home(),const Attendance(),const Routine(),const Profile(),const UserData()][_currentIndex],

          );
  }
}
