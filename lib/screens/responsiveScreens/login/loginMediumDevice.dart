import 'package:flutter/material.dart';
import 'package:studentapp/screens/homepage.dart';
import 'package:studentapp/screens/responsiveScreens/controllers/signup/signupFormController.dart';

class LoginMediumDevice extends StatefulWidget {
  const LoginMediumDevice({super.key});

  @override
  State<LoginMediumDevice> createState() => _LoginMediumDeviceState();
}

class _LoginMediumDeviceState extends State<LoginMediumDevice> {
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/logo/logo_1x.png"),
                        width: size.width * 0.25,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "JSSATEN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue[900]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Text(
                      "Welcome to JSSATEN, your home for discovery, innovation, and lifelong friendships.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                children: [
                  SizedBox(
                    width:300,
                    child: TextField(
                        controller: _controller1,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                          label: Text("University Email"),
                          hintText: "",
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                        controller: _controller2,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_sharp),
                          border: OutlineInputBorder(),
                          label: Text("Password"),
                          hintText: "",
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //Checkbox and Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    width: size.width * 0.6,
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
                    width: size.width * 0.6,
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
                                width: 1, color: Colors.grey.shade500),
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
