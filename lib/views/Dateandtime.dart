import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class dateandtime extends StatefulWidget {
  const dateandtime({super.key});

  @override
  State<dateandtime> createState() => _dateandtimeState();

}

class _dateandtimeState extends State<dateandtime> {
  DateTime selectedDate= DateTime.now();
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    String dates= new DateFormat('MMM').format(selectedDate);
    String years= new DateFormat('y').format(selectedDate);
    String days =new DateFormat('d').format(selectedDate);
    String weeks=new DateFormat('EEEE').format(selectedDate);
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0,0,0,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                height: size.height*0.06,
                width: size.width*0.34 ,


                decoration: BoxDecoration(color: Colors.red ,borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                        child: Text(dates,style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Jersey10-Regular'),)
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(30.0,08,0,0),
                        child: Text(years,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Jersey10-Regular'),)
                    ),

                  ],
                ),



              ),


            ],


          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0,0,0,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                height: size.height*0.1100,
                width: size.width*0.34,


                decoration: BoxDecoration(color: Colors.grey.shade800,borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
                child: ElevatedButton(onPressed: () async{
                  final DateTime? pickedDate= await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate:DateTime(2000),
                      lastDate: DateTime(2025)
                  );
                  if(pickedDate!=null){
                    setState(() {
                      selectedDate=pickedDate;
                    });

                  };
                },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,5,10),
                        child: Text(days,style: TextStyle(fontFamily: 'Jersey10-Regular',fontSize: 45),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,18,0,0),
                        child: Text(weeks,style: TextStyle(fontFamily:'Jersey10-Regular',fontWeight: FontWeight.bold,fontSize: 16),),
                      ),
                    ],
                  ),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade800)),
                ),






              ),



            ],


          ),
        ),
      ],

    );
  }
}
