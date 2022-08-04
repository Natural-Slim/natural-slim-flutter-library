import 'dart:convert';

import 'package:natural_slim_flutter_library/controllers/settings/settings_controller.dart';
import 'package:natural_slim_flutter_library/models/settings/response/user_settings_response_model.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_settings_shared_preferences.dart';

class SettingsHelper {
  
  /// Method to get user settings.
  ///
  /// Confirm if there are basic cached configurations, if not, 
  /// run the endpoint to download the configurations and cache 
  /// the information.
  Future<UserSettingsResponseModel> getUserSettings() async {
    UserSettingsResponseModel? settings = await UserSettingsSharedPreferences.getUserSettings();
    
    if(settings == null){
      settings = await SettingsController().getUserSettings(); // Get the settings from the API
      await UserSettingsSharedPreferences.saveUserSettings(jsonEncode(settings)); // Save settings in shared preferences
    }

    return settings;
  }
}