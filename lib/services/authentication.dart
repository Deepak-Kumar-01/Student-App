import 'package:firebase_auth/firebase_auth.dart';
import 'package:studentapp/modals/authStudent.dart';
import 'package:studentapp/services/secureStorage.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in Anonymously
  // Future<User?> signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     return result.user;
  //   } catch (e) {
  //     print("SignIn Anonymously Failed");
  //   }
  // }

  //Converting User user into CustomStudent user in customStudent
  CustomStudent? _userFromFirebaseUser(User? user) {
    print("user role:${user?.uid}");
    return user != null ? CustomStudent(uid: user.uid) : null;
  }

  Future<CustomStudent?> signInCustomAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print("SignInCustom Anonymously Failed");
    }
  }

  // Stream<CustomStudent?> get user {
  //   return _auth
  //       .authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  // }
  Stream<CustomStudent?> get user {
    return _auth
        .authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  }

  Future<User?> signInCustomStudentUniversityRoll(
      String emailId, String pass) async {
    try {
      // UserCredential result=await _auth.signInWithEmailAndPassword(email: "23mca029@jssaten.ac.in", password: "@123deepak");
      UserCredential? userCredential=await _auth.signInWithEmailAndPassword(email: emailId, password: pass);
      print("UID:${userCredential.user?.uid}");
      return userCredential.user;
    } catch (e) {
      print("Error while logging in with University Roll: $e");
    }
  }

  //Sign in with University Roll and Custom Password
  Future<User?> signInWithUniversityRoll(String emailId, String pass) async {
    try {
      // UserCredential result=await _auth.signInWithEmailAndPassword(email: "23mca029@jssaten.ac.in", password: "@123deepak");
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: emailId, password: pass);

      return result.user;
    } catch (e) {
      print("Error while logging in with University Roll: $e");
    }
  }

  //Creating User Auth credential via excel
  Future<String?> createAuthCredential(
      String universityEmailId, String pass) async {
    try {
      UserCredential? userCredential=await _auth.createUserWithEmailAndPassword(
          email: universityEmailId, password: pass);
      return userCredential.user?.uid;
    } catch (e) {
      print("Error while creating usercredential $e");
    }
  }

  Future<bool> createAuthWithList(List<Map<String, dynamic>> list) async {
    try {
      for (int i = 0; i < list.length; i++) {
        await _auth.createUserWithEmailAndPassword(
            email: list[i]['university_email_id'], password: list[i]['dob']);
        return true;
      }
      return true;
    } catch (e) {
      print("Error while creating auth with List");
      return false;
    }
  }

  Future<void> signOutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error in signning out $e");
    }
  }
}
