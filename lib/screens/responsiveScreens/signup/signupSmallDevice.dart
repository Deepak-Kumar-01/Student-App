import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../homepage.dart';
import '../controllers/login/loginFormController.dart';

const List<String> semesterList = <String>[
  '1st sem',
  '2nd sem',
  '3rd sem',
  '4th sem',
  '5th sem',
  '6th',
  '7th',
  '8th',
  '9th',
  '10th',
  'None'
];
const List<String> branchList = <String>['MCA', 'BPharma', 'BTech'];

class SignUpSmallDevice extends StatefulWidget {
  const SignUpSmallDevice({super.key});

  @override
  State<SignUpSmallDevice> createState() => _SignUpSmallDeviceState();
}

class _SignUpSmallDeviceState extends State<SignUpSmallDevice> {
  String dropdownValue = semesterList.first;
  String branchDropdown = branchList.first;
  bool isLoginClicked = false;
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late TextEditingController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[900],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
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
                        width: size.width * 0.20,
                      ),
                    SizedBox(width: 10,),
                      Text(
                        "JSSATEN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
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
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //Login Form
              Form(
                  child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      maxLines: 1,
                        controller: _controller1,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(30)
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
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
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(30)
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          label: Text("Password"),
                          hintText: "",
                        )),
                  ),
                  isLoginClicked
                      ? SizedBox(height: 0)
                      : SizedBox(
                          height: 20,
                        ),
                  isLoginClicked
                      ? Text("")
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: size.width * 0.34,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                ),
                                value: dropdownValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: semesterList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            SizedBox(
                              width: size.width * 0.4,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                                ),
                                value: branchDropdown,
                                onChanged: (String? value) {
                                  setState(() {
                                    branchDropdown = value!;
                                  });
                                },
                                items: branchList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                  isLoginClicked
                      ? SizedBox(height: 0)
                      : SizedBox(
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
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // CREATE ACCOUNT BUTTON
                      SizedBox(
                        width: size.width * 0.4,
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage()));
                              });
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(5),
                                // shape: RoundedRectangleBorder(),
                                backgroundColor: Colors.blue[900])),
                      ),

                      // LOGIN BUTTON
                      SizedBox(
                        width: size.width * 0.4,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResponsiveLogin()));
                                // isLoginClicked = true;
                              });
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(color: Colors.grey[900], fontSize: 14),
                            ),
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    width: 1, color: Colors.grey.shade500),
                                padding: EdgeInsets.all(5),
                                backgroundColor: Colors.white)),
                      )
                    ],
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
