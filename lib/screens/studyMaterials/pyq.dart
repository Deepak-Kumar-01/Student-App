import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/services/databaseServices.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher_string.dart';

class PYQ extends StatefulWidget {
  const PYQ({super.key});

  @override
  State<PYQ> createState() => _PYQState();
}

class _PYQState extends State<PYQ> {
  List<Reference> notes=[];
  Future<List<Reference>> getNotes() async {
    // Assuming DatabaseServices().getMcaNotes("first") returns a Future<List<Reference>>
    return await DatabaseServices().getMcaNotes("first") ?? [];
  }
  @override
  void initState() {
    super.initState();
    getNotes().then((result) {
      setState(() {
        notes = result;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Previous Year Questions",style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.blue[800],
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the back arrow color here
        ),
      ),
      body: FutureBuilder<List<Reference>>(
        future: getNotes(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }else{
            return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context,index){
                      Reference ref=notes[index];
                      return Column(
                        children: [
                          // _uploadDocument(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                            child: ListTile(
                              tileColor: Colors.grey[200],
                              trailing: IconButton(
                                onPressed: ()async{
                                  //downloading logic handled by app
                                  // print("Downloading Started...");
                                  // var result=await DatabaseServices().downloadFile(ref);
                                  // print("Downloading Finished.");
                                  // print(result);
                            
                                  //dowloading through url_launcher
                                  String urlRef=await ref.getDownloadURL();
                                  String url=urlRef.toString();
                                  print("Launch Url:$url");
                                  if(await canLaunchUrlString(url)){
                                    await launchUrlString(url);
                                  }else{
                                    print("can't launch url");
                                  }
                                },
                                 icon: Icon(Icons.download),
                                color: Colors.blue[800],
                              ),
                            
                              title: Text(ref.name),
                            
                            ),
                          )
                        ],
                      );
                    });
          }
        },
      )
    );
  }

  ElevatedButton _uploadDocument() {
    return ElevatedButton(
      onPressed: ()async{
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          // type: FileType.custom,
          // allowedExtensions: ['xlsx'],
          // allowMultiple: false,
        );
        if(result!=null){
          File file = File(result.files.single.path!);
          print(file);
          // await DatabaseServices().uploadDocument(file);
        }
      },
      child: Text("Upload"),
    );
  }
}

