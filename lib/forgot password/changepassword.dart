import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({Key? key});
  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final TextEditingController passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
     child:  Container(
      height: 150,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Change Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            ),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon:Icon(Icons.close)),

          ],
        ),
          SizedBox(height: 20,),
          TextField(
            controller:passwordController ,
            decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Enter New Password",hintText: "New Password",
          ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Enter OTP",hintText: "1234", ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){},
            child: Text("Change Password",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            style: ElevatedButton.styleFrom(backgroundColor:Colors.blueAccent ),
          ),
        ],
      ),
    ),);
      

  }
}
