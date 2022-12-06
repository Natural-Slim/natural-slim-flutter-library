import 'dart:convert';

import 'package:natural_slim_flutter_library/constants/app_constans.dart';
import 'package:natural_slim_flutter_library/models/settings/response/data_app_settings_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataAppSettingsSharedPreferences{

  /// Method for saving app data settings from shared preferences
  static Future<bool> saveDataAppSettings(String dataAppSettings) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      return await prefs.setString(AppConstants.preferencesDataAppSettings, dataAppSettings);
    } catch(e) {
      rethrow;
    }
  }

  /// Method to get app data settings from shared preferences
  static Future<DataAppSettingsResponseModel?> getDataAppSettings() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? dataAppSettings = prefs.getString(AppConstants.preferencesDataAppSettings);

      if(dataAppSettings == null || dataAppSettings == ""){
        return null;
      }

      return DataAppSettingsResponseModel.fromJson(jsonDecode(dataAppSettings));
    } catch(e) {
      rethrow;
    }
  }

  /// Method to remove app data settings from shared preferences
  static Future<bool> deleteDataAppSettings() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesDataAppSettings);
    } catch (e) {
      rethrow;
    }
  }

}