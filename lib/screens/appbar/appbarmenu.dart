
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
                    child: Builder(builder: (context) {
                      return IconButton(
                        icon: Icon(Icons.menu, color: Colors.white, size: 30,),
                        onPressed: () {
                          print("Drawer");
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },)
                ),

                Spacer(),

                Padding(
                  padding: EdgeInsets.all(11.0),
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
                Text("Clubs", style: myStyle,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
