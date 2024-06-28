import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/screens/homepage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mobile Application",
      home: Homepage(),  //--------Initial home------------
    );
  }
}



// -----------image demo-----------------
// class ImageContainer extends StatefulWidget {
//   const ImageContainer({super.key});
//   @override
//   State<ImageContainer> createState() => _ImageContainerState();
// }
// class _ImageContainerState extends State<ImageContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: Image(
//           image: AssetImage(
//             "assets/images/bg.jpg"
//           ),
//         ),
//       ),
//     );
//   }
// }
//
