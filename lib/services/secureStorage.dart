import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage{
  static final _storage=FlutterSecureStorage();
  static const _keyUserUid='uid';
  static const _onBoarding="onboarding";

  //UID Setter
  static Future setUserUID(String uid)async{
    await _storage.write(key: _keyUserUid, value: uid);
  }
  //UID Getter
  static Future<String?>getUserUID()async{
    String? result=await _storage.read(key: _keyUserUid);
    return result;
  }
  //Onboarding Setter
  static Future setOnboarding(String isOnboarded)async{
    await _storage.write(key: _onBoarding, value: isOnboarded.toString());
  }
  //Onboarding Getter
  static Future<String?>getOnboarding()async{
    String? result=await _storage.read(key: _onBoarding);
    return result;
  }
}