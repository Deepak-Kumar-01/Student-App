import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';


class jssaten extends StatefulWidget {
  const jssaten ({super.key});


  @override
  State<jssaten> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<jssaten> {
  DateTime selectedDate= DateTime.now();





  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    String formatedate= new DateFormat('MMM').format(selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CODE-ZEN'),
      ),
      body: Container(

          child:Padding(
            padding: const EdgeInsets.fromLTRB(1.0,20.0,4.0,5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(1.0,0.0,15.0,0.0),
                  child: Container(
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
                ),
                Container(
                  height: size.height*0.17,
                  width: size.width*0.33,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade800),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height*0.06,
                        width: size.width*0.33 ,


                        decoration: BoxDecoration(color: Colors.red ,borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4.0,0,0,0),
                              child: ElevatedButton(
                                onPressed:() async{
                                  final DateTime? datePicked=await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate:DateTime(2000),
                                      lastDate: DateTime(2030)
                                  );
                                  if(datePicked!=null){
                                    setState(() {
                                      selectedDate=datePicked;
                                    });




                                  }
                                },
                                child:
                                    Text(formatedate),


                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                              ),
                            ),
                          ],


                        ),
                      ),
                    ],


                  ),
                ),
              ],


            ),
          )
      ),




    );
  }
}

