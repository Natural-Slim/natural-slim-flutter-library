import 'dart:convert';

import 'package:natural_slim_flutter_library/constants/app_constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/authentication/responses/user_profile_information_response_model.dart';

class ProfileSharedPreferences{

  /// Method for saving app data settings from shared preferences
  static Future<bool> saveProfile(String dataAppSettings) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      return await prefs.setString(AppConstants.preferencesProfile, dataAppSettings);
    } catch(e) {
      rethrow;
    }
  }

  /// Method to get app data settings from shared preferences
  static Future<UserProfileInformationResponseModel?> getProfile() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? dataAppSettings = prefs.getString(AppConstants.preferencesProfile);

      if(dataAppSettings == null || dataAppSettings == ""){
        return null;
      }

      return UserProfileInformationResponseModel.fromJson(jsonDecode(dataAppSettings));
    } catch(e) {
      rethrow;
    }
  }

  /// Method to remove app data settings from shared preferences
  static Future<bool> deleteProfile() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesProfile);
    } catch (e) {
      rethrow;
    }
  }

}