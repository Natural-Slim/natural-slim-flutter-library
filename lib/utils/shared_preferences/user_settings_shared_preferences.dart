import 'dart:convert';

import 'package:natural_slim_flutter_library/constants/app_constans.dart';
import 'package:natural_slim_flutter_library/models/settings/response/user_settings_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingsSharedPreferences{

  /// Method for saving user settings from shared preferences
  static Future<bool> saveUserSettings(String settings) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      return await prefs.setString(AppConstants.preferencesSettings, settings);
    } catch(e) {
      rethrow;
    }
  }

  /// Method to get user settings from shared preferences
  static Future<UserSettingsResponseModel?> getUserSettings() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? settings = prefs.getString(AppConstants.preferencesSettings);

      if(settings == null || settings == ""){
        return null;
      }

      return UserSettingsResponseModel.fromJson(jsonDecode(settings));
    } catch(e) {
      rethrow;
    }
  }

  /// Method to remove user settings from shared preferences
  static Future<bool> deleteUserSettings() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesSettings);
    } catch (e) {
      rethrow;
    }
  }

}