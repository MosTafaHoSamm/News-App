import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static    SharedPreferences sharedPreferences;
  static Future init()async {
     return sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future<bool>putBool({
    String key,
    bool value,

})async{
    return await sharedPreferences.setBool(key, value);

  }
  static bool  getBool({  String key}){
    return sharedPreferences.getBool(key);
  }


}