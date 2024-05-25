import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:studentapp/modals/users.dart';

const String USERS_REF = "users";

class DatabaseServices {
  final _firestore = FirebaseFirestore.instance;
  late DocumentReference<AppUser> _userDocRef;
  late final CollectionReference _usersRef;
  DatabaseServices() {
    _usersRef = _firestore.collection(USERS_REF).withConverter<AppUser>(
        fromFirestore: (snapshots, _) => AppUser.fromJson(snapshots.data()!),
        toFirestore: (appUser, _) => appUser.toJson());
  }
  Future<void> addUser(AppUser appUser)async{
    var uid=await FirebaseAuth.instance.currentUser?.uid;
     _userDocRef = _usersRef.doc(uid).withConverter<AppUser>(
      fromFirestore: (snapshots, _) => AppUser.fromJson(snapshots.data()!),
      toFirestore: (appUser, _) => appUser.toJson(),
    );
    await _userDocRef.set(appUser);
  }
  Stream<DocumentSnapshot<AppUser>> getUserData(String uid) {
    DocumentReference<AppUser> _userDocRef = _usersRef.doc(uid).withConverter<AppUser>(
      fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
      toFirestore: (appUser, _) => appUser.toJson(),
    );
    return _userDocRef.snapshots();
  }

}
