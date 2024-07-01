
import 'package:flutter/material.dart';

import 'changepassword.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({Key? key}):super(key:key);

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
 final  TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  // void sendOTP() async {
  //  EmailAuth emailAuth= EmailAuth(sessionName: 'Test Session');
  //   var res = await emailAuth.sendOtp(
  //       recipientMail: emailController.text,otpLength: 4);
  //   if(res){
  //     print("OTP sent");
  //   }
  //   else{
  //     print("We could not sent OTP");
  //   }
  // }

 // void verifyOTP() async {
 //   EmailAuth emailAuth = EmailAuth(sessionName: 'Sample session');
 //   // Configure the remote server if needed: emailAuth.config(remoteServerConfiguration);
 //
 //   var res = await emailAuth.validateOtp(
 //     recipientMail: emailController.text,userOtp:otpController.text // Replace with the actual OTP entered by the user
 //   );
 //   if(res){
 //     Navigator.push(
 //       context,
 //       MaterialPageRoute(builder: (context) => Changepassword()), // Corrected widget name
 //     );
 //   }else{
 //     print("Invalid OTP");
 //   }
 // }

 @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextButton(onPressed: () {
            myDialogBox(context);
          },
            child: Text("Forgot Password"),

          )





    );
  }

  void myDialogBox(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return Dialog( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: 350,
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
                  decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Enter Email",hintText: "eg. abc@gmail.com",suffixIcon: TextButton(
                    child: Text("Send OTP"),
                    onPressed: ()=>{
                      // sendOTP();
                    } ,
                  ) ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: otpController,
                  decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Enter OTP",hintText: "1234", ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: ()=> {
                  // verifyOTP()
                },
                 child: Text("Verify",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(backgroundColor:Colors.blueAccent ),
                ),
              ],
            ),
          ));
    });
  }
}

