import 'dart:convert';

import 'package:natural_slim_flutter_library/controllers/settings/settings_controller.dart';
import 'package:natural_slim_flutter_library/models/settings/response/user_settings_response_model.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/data_settings_shared_preferences.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_settings_shared_preferences.dart';

import '../../models/settings/response/data_app_settings_response_model.dart';

class SettingsHelper {
  
  /// Method to get user settings.
  ///
  /// Confirm if there are basic cached configurations, if not, 
  /// run the endpoint to download the configurations and cache 
  /// the information.
  Future<UserSettingsResponseModel> getUserSettings() async {
    try{
      UserSettingsResponseModel? settings = await UserSettingsSharedPreferences.getUserSettings();
    
      if(settings == null){
        settings = await SettingsController().getUserSettings(); // Get the settings from the API
        await UserSettingsSharedPreferences.saveUserSettings(jsonEncode(settings)); // Save settings in shared preferences
      }

      return settings;
    } catch(e) {
      rethrow;
    }
  }

  Future<DataAppSettingsResponseModel> getDataAppSettings() async {
    try{
      DataAppSettingsResponseModel? dataAppsettings = await DataAppSettingsSharedPreferences.getDataAppSettings();
    
      if(dataAppsettings == null){
        dataAppsettings = await SettingsController().getDataSettings(); // Get the settings from the API
        await DataAppSettingsSharedPreferences.saveDataAppSettings(jsonEncode(dataAppsettings)); // Save settings in shared preferences
      }

      return dataAppsettings;
    } catch(e) {
      rethrow;
    }
  }
}