import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studentapp/modals/users.dart';
import 'package:studentapp/services/secureStorage.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';


const String USERS_REF = "users";

class DatabaseServices {
  final _firestore = FirebaseFirestore.instance;
  late DocumentReference<AppUser> _userDocRef;
  late final CollectionReference _usersRef;

  //Constructor initializing _userRef Collection Reference
  DatabaseServices() {
    _usersRef = _firestore.collection(USERS_REF).withConverter<AppUser>(
        fromFirestore: (snapshots, _) => AppUser.fromJson(snapshots.data()!),
        toFirestore: (appUser, _) => appUser.toJson());
  }

  //Adding User data after creating authentication
  Future<void> addUser(AppUser appUser)async{
    var uid=await FirebaseAuth.instance.currentUser?.uid;
     _userDocRef = _usersRef.doc(uid).withConverter<AppUser>(
      fromFirestore: (snapshots, _) => AppUser.fromJson(snapshots.data()!),
      toFirestore: (appUser, _) => appUser.toJson(),
    );
    await _userDocRef.set(appUser);
  }

  //Stream of data for appUser
  Stream<DocumentSnapshot<AppUser>> getUserData(String uid) {
    DocumentReference<AppUser> _userDocRef = _usersRef.doc(uid).withConverter<AppUser>(
      fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
      toFirestore: (appUser, _) => appUser.toJson(),
    );
    return _userDocRef.snapshots();
  }

  //Fetching notes logic
  Future<List<Reference>?> getMcaNotes(String sem)async{
   try{
     final userId=await UserSecureStorage.getUserUID();
     print("1 $userId");
     final storageRef= await FirebaseStorage.instance.ref();
     print("2 $storageRef");
     final docsRefs= await storageRef.child("mca/$sem/pyq-cia");
     print("3 $docsRefs");
     final docs = await docsRefs.listAll();
     print("Documents: ${docs.items.length} items found");
     if (docs.items.isEmpty) {
       print("No files found at the specified path.");
     } else {
       for (var item in docs.items) {
         print("Found file: ${item.name}");
       }
       return docs.items;
     }
   }catch(e){
     print("Error whiling fetching MCA Notes: $e");
   }
  }

  //Upload new docs to firebaseStorage
  Future<bool> uploadDocument(File file)async{
    try{
      final userId=await UserSecureStorage.getUserUID();
      print("1 $userId");
      final storageRef= await FirebaseStorage.instance.ref();
      print("2 $storageRef");
      final filename=file.path.split('/').last;
      print("Filename: $filename");
      final docsRefs= await storageRef.child("mca/first/notes/$filename-test");
      await docsRefs.putFile(file);
      return true;
    }catch(e){
      print("Error While Uploading: $e");
      return false;
    }
  }

  //Dowload via app Logic
  Future downloadFile(Reference ref)async{
    var status = await Permission.storage.request();
    if(status.isGranted){
      print("Permission Granted");
      final url=await ref.getDownloadURL();
      print(url);
      String fileName=ref.name;
      print("URL: $fileName");
      final Directory downloadDir = Directory('/storage/emulated/0/Download');
      String? path=downloadDir.path;
      print("Download path: $path");
      String storagePath="${path}/$fileName";
      print("storagePath: $storagePath");
      try {
        // Download the file from the URL
        http.Response response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          // Save the file locally
          File localFile = File(storagePath);
          await localFile.writeAsBytes(response.bodyBytes);
          print("File downloaded successfully to: $storagePath");
        } else {
          throw Exception('Failed to download file');
        }
      } catch (e) {
        print("Error downloading and saving file: $e");
        rethrow;
      }
    }else{
      print("Storage permission denied");
    }

  }
}
