import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/services/authentication.dart';
import 'package:studentapp/wrapper.dart';
import '../../../flashMessage/customSnackBar.dart';
import '../../../services/secureStorage.dart';

class LoginSmallDevice extends StatefulWidget {
  const LoginSmallDevice({super.key});

  @override
  State<LoginSmallDevice> createState() => _LoginSmallDeviceState();
}

class _LoginSmallDeviceState extends State<LoginSmallDevice> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final AuthServices _authRef = AuthServices();

  Future<void> _loginAndNavigate() async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue[900],
          ),
        );
      },
    );
    User? user;
    try {
      user = await _authRef.signInCustomStudentUniversityRoll(
          _controller1.text, _controller2.text);
      print("user fetched:${user?.uid}");
    } catch (e) {
      print("Error:$e");
    }
    // Close the dialog
    if (mounted) {
      Navigator.of(context).pop();
    }
    if(user!=null){
      try{
        await UserSecureStorage.setUserUID(
            "${user.uid}");
        if(mounted){
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Wrapper()),
                (Route<dynamic> route) => false,
          );
        }
      }catch(e){
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: CustomSnackBar(errorMsg: "${e.toString()}"),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        }
      }
    }else{
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackBar(errorMsg: "User does not exist"),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                        image: const AssetImage("assets/logo/logo_1x.png"),
                        width: size.width * 0.20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
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
                  const SizedBox(
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
              const SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                        maxLines: 1,
                        controller: _controller1,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(30)
                              ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          label: Text("University Email"),
                          hintText: "",
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                        controller: _controller2,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password_sharp),
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(30)
                              ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          label: Text("Password"),
                          hintText: "",
                        )),
                  ),
                  const SizedBox(
                    height: 15,
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
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: _loginAndNavigate,
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(5),
                                // shape: RoundedRectangleBorder(),
                                backgroundColor: Colors.blue[900]),
                            child: const Text(
                              "Log in",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                      ),
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
