

import 'package:shared_preferences/shared_preferences.dart';

enum prefsKeys{
 lang,

}
class SharedPerf {
  static final SharedPerf _instance= SharedPerf._();
  SharedPerf._();
  late SharedPreferences _sharedPreferences;

  factory SharedPerf(){
    return _instance;
  }
  Future<void> initPref() async
  {
    _sharedPreferences=await SharedPreferences.getInstance();
  }
  Future<void> save({required String lang})async
  {
    await _sharedPreferences.setString(prefsKeys.lang.toString(),lang);
  }

  String get lang =>_sharedPreferences.getString(prefsKeys.lang.toString())??"ar";
  Future<bool> clear() async{
    return await _sharedPreferences.clear();
  }


}