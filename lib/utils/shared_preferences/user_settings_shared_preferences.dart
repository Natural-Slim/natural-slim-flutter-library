import 'dart:convert';

import 'package:natural_slim_flutter_library/constants/app_constans.dart';
import 'package:natural_slim_flutter_library/models/settings/response/user_settings_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingsSharedPreferences{

  static Future<bool> saveValueSettings(String settings) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      return await prefs.setString(AppConstants.preferencesSettings, settings);
    } catch(e) {
      rethrow;
    }
  }

  static Future<UserSettingsResponseModel?> getSavedUserSettings() async {
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

}