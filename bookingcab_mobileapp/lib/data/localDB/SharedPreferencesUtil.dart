import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  // static late SharedPreferences _prefs;

  static late String KEY_USER_LOGIN = "isLogin";
  static late String KEY_USER_ID = "user_id";
  static late String KEY_USER_FIRST_NAME = "first_name";
  static late String KEY_USER_LAST_NAME = "last_name";
  static late String KEY_USER_EMAIL_ID = "email";
  static late String KEY_USER_MOBILE_PREFIX = "mobile_prefix";
  static late String KEY_USER_MOBILE_NO = "mobile";
  static late String KEY_USER_IS_ACTIVE = "is_active";
  static late String KEY_USER_SIGNUP_STATUS = "signup_status";
  static late String KEY_COUNTRY_ID = "country_id";
  static late String KEY_USER_TOCKEN = "token";
  static late String KEY_USER_GRADE = "user_grade";
  static late String KEY_USER_TYPE_ID = "user_type_id";
  static late String KEY_COMPANY_ID = "company_id";


  // Load data from shared preferences
  static Future<bool> isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(KEY_USER_LOGIN) ?? false;
  }

  // Save data to shared preferences
  static Future<void> saveUserProfileData(
      String userID,
      String userFirstName,
      String userLastName,
      String userEmailId,
      String userMobileNo,
      String userMobilePrefix) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool(KEY_USER_LOGIN, true);
    await _prefs.setString(KEY_USER_ID, userID);
    await _prefs.setString(KEY_USER_FIRST_NAME, userFirstName);
    await _prefs.setString(KEY_USER_LAST_NAME, userLastName);
    await _prefs.setString(KEY_USER_EMAIL_ID, userEmailId);
    await _prefs.setString(KEY_USER_MOBILE_NO, userMobileNo);
    await _prefs.setString(KEY_USER_MOBILE_PREFIX, userMobilePrefix);
  }

  static Future<void> saveDataKeyValue(String key, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(key, value);
  }

  // Load data from shared preferences
  static Future<String> getDataBykey(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key) ?? '';
  }

/*
  // Check if data exists in shared preferences
  static bool hasData(String key)  {
     SharedPreferences _prefs =  SharedPreferences.getInstance();
    return _prefs.containsKey(key);
  }
*/

  // Remove data from shared preferences
  static Future<void> removeData(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.remove(key);
  }

  // Clear all data from shared preferences
  static Future<void> clearData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
  }
}
