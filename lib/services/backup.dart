// Future<void> downloadFile(String name) async {
//   try {
//     // Get the file URL from Firebase Storage
//     String fileUrl = await getFileUrlFromFirebase("mca/first/notes/$name");
//     print("fileUrl: $fileUrl");
//     // Get the local path to save the file
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     String appDocPath = appDocDir.path;
//     String? fileName=await retrieveFileName("mca/first/notes",name);
//     // String fileName=appDocPath.split("/").last;
//     print("FileName: $fileName");
//     String localFilePath = "$appDocPath/$fileName";
//     print("LocalFilePath: $localFilePath");
//
//     // Download the file and save it locally
//     await downloadAndSaveFile(fileUrl, localFilePath);
//
//     print("File downloaded and saved to: $localFilePath");
//   } catch (e) {
//     print("Error downloading file: $e");
//   }
// }
// Future<String> getFileUrlFromFirebase(String filePath) async {
//   try {
//     // Get a reference to the file
//     Reference storageRef = FirebaseStorage.instance.ref().child(filePath);
//
//     // Get the download URL
//     String fileUrl = await storageRef.getDownloadURL();
//     return fileUrl;
//   } catch (e) {
//     print("Error getting file URL: $e");
//     rethrow;
//   }
// }
// Future<void> downloadAndSaveFile(String fileUrl, String localFilePath) async {
//   try {
//     // Download the file from the URL
//     http.Response response = await http.get(Uri.parse(fileUrl));
//
//     if (response.statusCode == 200) {
//       // Save the file locally
//       File localFile = File(localFilePath);
//       // moveFileToDownloads(fileUrl);
//       await localFile.writeAsBytes(response.bodyBytes);
//     } else {
//       throw Exception('Failed to download file');
//     }
//   } catch (e) {
//     print("Error downloading and saving file: $e");
//     rethrow;
//   }
// }