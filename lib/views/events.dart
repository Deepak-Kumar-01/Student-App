import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class events extends StatelessWidget {
  const events({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;


    return Scaffold(
       body: Container(
         height: size.height*0.17,
         width: size.width*0.60,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),
         child: Column(


           children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(2.0,4.0,2.0,0.0),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [


                   Padding(
                     padding: const EdgeInsets.fromLTRB(1.0,15.0,8.0,0.0),
                     child: ElevatedButton.icon(
                       onPressed:()
                       {
                         if (kDebugMode) {
                           print("CLICKED");
                         };
                       },
                       icon: Icon(Icons.money,color: Colors.black,),
                       label: Text("MONEY",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                       style: ButtonStyle(
                         backgroundColor: MaterialStatePropertyAll(Colors.deepPurpleAccent.shade700),


                       ) ,
                     ),
                   ),




                   Padding(
                     padding: const EdgeInsets.fromLTRB(1.0,15.0,1,0.0),
                     child: ElevatedButton.icon(
                       onPressed:()
                       {
                         if (kDebugMode) {
                           print("CLICKED");
                         };
                       },
                       icon: Icon(Icons.money,color: Colors.black,),
                       label: Text("MONEY",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                       style: ButtonStyle(
                         backgroundColor: MaterialStatePropertyAll(Colors.white),


                       ) ,
                     ),
                   ),




                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.fromLTRB(2.0,2.0,2.0,4.0),
               child: Row(


                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(1.0,10.0,8.0,0.0),
                     child: ElevatedButton.icon(
                       onPressed:()
                       {
                         if (kDebugMode) {
                           print("CLICKED");
                         };
                       },
                       icon: Icon(Icons.money,color: Colors.black,),
                       label: Text("MONEY",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                       style: ButtonStyle(
                         backgroundColor: MaterialStatePropertyAll(Colors.white),


                       ) ,
                     ),
                   ),


                   Padding(
                     padding: const EdgeInsets.fromLTRB(1.0,10.0,1,0.0),
                     child: ElevatedButton.icon(
                       onPressed:()
                       {
                         if (kDebugMode) {
                           print("CLICKED");
                         };
                       },
                       icon: Icon(Icons.money),
                       label: Text("MONEY",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                       style: ButtonStyle(
                         backgroundColor: MaterialStatePropertyAll(Colors.black),


                       ) ,
                     ),
                   ),




                 ],
               ),
             ),


           ],
         ),




       ),
    );
  }
}
