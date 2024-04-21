import 'package:flutter/material.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/signup/signupFormController.dart';

import '../../homepage.dart';

class LoginSmallDevice extends StatefulWidget {
  const LoginSmallDevice({super.key});

  @override
  State<LoginSmallDevice> createState() => _LoginSmallDeviceState();
}

class _LoginSmallDeviceState extends State<LoginSmallDevice> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
          child: Column(
            children: [
              //Logo and Welcome Message
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/logo/logo_1x.png"),
                    width: size.width * 0.23,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome Everyone",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue[900]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Welcome to a World of Limitless Choices-Your Perfect Product Awaits!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800]),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                    children: [
                      TextField(
                          controller: _controller1,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                            label: Text("University Email"),
                            hintText: "",
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: _controller2,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password_sharp),
                            border: OutlineInputBorder(),
                            label: Text("Password"),
                            hintText: "",
                          )),
                      SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      //Checkbox and Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (val) {},
                              ),
                              Text("Remember Me")
                            ],
                          ),
                          TextButton(
                              onPressed: () {}, child: Text("Forgot Password?"))
                        ],
                      ),
                      //Buttons
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: size.width * 0.87,
                        child: ElevatedButton(
                            onPressed: () {
                             setState(() {
                               Navigator.pushReplacement(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) => Homepage()));
                             });
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(15),
                                // shape: RoundedRectangleBorder(),
                                backgroundColor: Colors.blue[900])),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.87,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResponsiveSignUp()));
                              });
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    width: 1, color: Colors.grey.shade800),
                                padding: EdgeInsets.all(15),
                                backgroundColor: Colors.white)),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
