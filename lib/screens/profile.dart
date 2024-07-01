import 'package:flutter/material.dart';
import 'package:studentapp/screens/Routine/timetable.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Example'),
      ),
      // drawer: Drawer(
      //     // Drawer contents
      //     ),
      body: Text("Profile")
    );
  }
}

//Scaffold(
//     appBar: AppBar(
//       title: Text('Drawer Demo'),
//     ),
//     body: Center(
//       child: Builder(
//         builder: (context) => ElevatedButton(
//           onPressed: () {
//             Scaffold.of(context).openDrawer();
//           },
//           child: Text('Open Drawer'),
//         ),
//       ),
//     ),
//     drawer: Drawer(
//       // Add your drawer content here
//     ),
//   );
