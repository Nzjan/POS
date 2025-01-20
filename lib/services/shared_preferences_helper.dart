import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesHelper{
  SharedPreferences? pref;

  void storeString(String key,String value)async{
    pref=await SharedPreferences.getInstance();
    await pref?.setString(key, value);
  }

  Future<String> getString(String key)async{
    pref=await SharedPreferences.getInstance();
    String value=( pref?.getString(key))??"not found";
    return value;
  }

}