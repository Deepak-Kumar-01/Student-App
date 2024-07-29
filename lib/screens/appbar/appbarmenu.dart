import 'package:flutter/material.dart';
import 'package:studentapp/screens/clubList/ClubList.dart';
import 'package:studentapp/screens/facultyList/FacultyList.dart';
import 'package:studentapp/screens/studyMaterials/notes.dart';
import 'package:studentapp/screens/studyMaterials/pyq.dart';

class AppBarMenu extends StatefulWidget {
  const AppBarMenu({super.key});

  @override
  State<AppBarMenu> createState() => _AppBarMenuState();
}

class _AppBarMenuState extends State<AppBarMenu> {
  TextStyle myStyle = TextStyle(
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 10,  //height is not working, use padding to adjust menu
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(11.0),
                    child: Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            print("Drawer");
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    )),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(11.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    highlightColor: Colors.green,
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => PYQ()));
                    },
                    child: Text(
                      "PYQ    ",
                      style: myStyle,
                    )),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Notes()));
                  },
                  child: Text(
                    "Notes  ",
                    style: myStyle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => FacultyList()));
                  },
                  child: Text(
                    "Faculty",
                    style: myStyle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => ClubList()));
                  },
                  child: Text(
                    "Clubs",
                    style: myStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
