import 'dart:convert';

import 'package:natural_slim_flutter_library/constants/app_constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrySharedPreferences{

  /// Method for saving user settings from shared preferences
  static Future<bool> saveRegistry(Map<String, dynamic>? valuesRegistry) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      return await prefs.setString(AppConstants.preferencesRegistry, jsonEncode(valuesRegistry));
    } catch(e) {
      rethrow;
    }
  }

  /// Method to get user settings from shared preferences
  static Future<Map<String, dynamic>?> getRegistry() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? valuesRegistry = prefs.getString(AppConstants.preferencesRegistry);

      if(valuesRegistry == null || valuesRegistry == ""){
        return null;
      }

      var go = jsonDecode(valuesRegistry);

      return go;
    } catch(e) {
      rethrow;
    }
  }
  
}