import 'package:flutter/material.dart';
import 'package:studentapp/services/authentication.dart';
import 'package:studentapp/services/secureStorage.dart';
import '../../wrapper.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({super.key});

  @override
  State<AppSetting> createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  AuthServices _authRef = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Center(
          child: SizedBox(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.blue[900],
                              ),
                            );
                          });
                      await _authRef.signOutUser();
                      await UserSecureStorage.setUserUID("null");
                      if(mounted){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) =>Wrapper()),
                          (Route<dynamic> route) => false,
                        );
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Logout")
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
