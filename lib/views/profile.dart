import 'package:flutter/material.dart';
    class Profile extends StatefulWidget {
      const Profile({super.key});

      @override
      State<Profile> createState() => _ProfileState();
    }

    class _ProfileState extends State<Profile> {
      @override
      Widget build(BuildContext context) {
        return Column(
          children: [
            Row(
              children: [
                Container(
                  child: Text("PROFILE"),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 20,
                  ),
                )
              ],
            ),

          ],
        );
      }
    }
