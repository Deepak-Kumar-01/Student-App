
import 'package:flutter/material.dart';

class AppBarMenu extends StatefulWidget {
  const AppBarMenu({super.key});

  @override
  State<AppBarMenu> createState() => _AppBarMenuState();
}

class _AppBarMenuState extends State<AppBarMenu> {
  TextStyle myStyle = TextStyle(color: Colors.white,);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, bottom: 20, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(11.0),
                  // child: Icon(Icons.menu, color: Colors.white, size: 30,),
                  child: IconButton(
                    icon: Icon(Icons.menu, color: Colors.white, size: 30,),
                    onPressed: () {
                      print("Drawer");
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                Spacer(),

                // ElevatedButton(onPressed: () {
                //   return print("object");
                // }, child: Text("click")),

                Padding(
                  padding: EdgeInsets.all(11.0),
                  // child: Icon(Icons.notifications, color: Colors.white, size: 30,),
                  child: IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white, size: 30,),
                    onPressed: () {},
                  ),

                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("PYQ    ", style: myStyle,),
                Text("Notes  ", style: myStyle,),
                Text("Faculty", style: myStyle,),
                Text("Clubs  ", style: myStyle,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
