import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/services/databaseServices.dart';
import 'package:studentapp/services/secureStorage.dart';

import 'modals/users.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  String? _uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    print("USER DATA uid:${_uid}");
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<AppUser>>(
        stream: DatabaseServices().getUserData(_uid!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Document does not exist'));
          }
          AppUser? user = snapshot.data!.data();
          if (user == null) {
            return Center(child: Text('User data is null'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${user.name}'),
              Text('PersonalEmail: ${user.personalEmail}'),
              // Add other fields as needed
              Container(
                height: 10,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.black.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 1,
                      color: Colors.red,
                      offset: Offset(0, 30), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
// Column(
// children: [
// ElevatedButton(
// onPressed: ()async {
// var uid=await UserSecureStorage.getUserUID();
// await DatabaseServices().getUserData(uid!);
// print("Fetching User Data..");
// },
// child: Text("Fetch User Data")),
// ],
// ),
