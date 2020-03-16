import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  SharedPreferences pref;

  static const String KEY_ISOLD = "isold";

  setOld(bool old) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(SharedPref.KEY_ISOLD, old);
  }

  Future<bool> getOld() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(SharedPref.KEY_ISOLD) ?? false;
  }

}