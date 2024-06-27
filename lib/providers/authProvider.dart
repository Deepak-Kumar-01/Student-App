import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:studentapp/modals/routine.dart';

import '../modals/users.dart';

class MyAuthProvider with ChangeNotifier {
  User? _user;
  AppUser? _appUser;
  Timetable? _timetable;

  User? get user => _user;
  AppUser? get appUser => _appUser;
  Timetable? get timetable=>_timetable;

  MyAuthProvider() {
    _initAuth();
  }

  void _initAuth() {
    FirebaseAuth.instance.authStateChanges().listen(_authStateChanged);
  }

  Future<void> _authStateChanged(User? user) async {
    _user = user;
    if (user != null) {
      // await _fetchUserData();
      await _listenToUserData();
    } else {
      _appUser = null;
    }
    notifyListeners();
  }

  // Future<void> _fetchUserData() async {
  //   try{
  //     DocumentSnapshot doc = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(_user!.uid)
  //         .get();
  //     _appUser = AppUser.fromJson(doc.data() as Map<String, Object?>);
  //   }catch(e){
  //     print("Data Fetching Failed:$e");
  //   }
  //   print("Fetched User Data inside MyAuthProvider:${_appUser?.name}");
  //   notifyListeners();
  // }
  Future<void> _listenToUserData()async{
   try{
     FirebaseFirestore.instance
         .collection('users')
         .doc(_user!.uid)
         .snapshots()
         .listen((snapshot) {
       if (snapshot.exists) {
         _appUser = AppUser.fromJson(snapshot.data() as Map<String, Object?>);
         notifyListeners();
       }
     });
   }catch(e){
     print("$e");
   }
  }
  // Future<void> _listenToTimeTable()async{
  //   try{
  //
  //   }catch(e){
  //     print("$e");
  //   }
  // }

  Future<User?> signIn(String email, String password) async {
    UserCredential? userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _user;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error in signning out $e");
    }
  }

}