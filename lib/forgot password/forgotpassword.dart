
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Forgetpassword extends StatefulWidget {
  const Forgetpassword({Key? key}):super(key:key);

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextButton(onPressed: () {
            myDialogBox(context);
          },
            child: Text("Reset Password"),

          )





    );
  }

  void myDialogBox(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return Dialog( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: 240,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Forget Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon:Icon(Icons.close)),

                ],
              ),
                SizedBox(height: 20,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Enter Email",hintText: "eg. abc@gmail.com", ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: ()async{
                  try {
                    await auth.sendPasswordResetEmail(email: emailController.text);
                  }catch(error){

                    print('Error sending password reset email: $error');
                  }
                }, child: Text("Reset Password",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(backgroundColor:Colors.blueAccent ),
                ),
              ],
            ),
          ));
    });
  }
}

