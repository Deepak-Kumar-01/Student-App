import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: Text('Example'),
      // ),
      drawer: Drawer(
          // Drawer contents
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            ElevatedButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Text("Open")),

          ],
        ),
      ),
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
