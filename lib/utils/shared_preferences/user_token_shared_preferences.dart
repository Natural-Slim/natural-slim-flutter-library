import 'package:natural_slim_flutter_library/constants/app_constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class to handle login token in app preferences
class UserTokenSharedPreferences {

  /* =============================================================== */
  /* ============================= SET ============================= */

  /// Method to save token
  static Future<bool> saveValueToken(String token) async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setString(AppConstants.preferencesKeyToken, token);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to save token expiration date and time
  static Future<bool> saveValueTokenExpiration(String tokenExpiration) async{
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setString(AppConstants.preferencesTokenExpiration, tokenExpiration);
    } catch (e) {
      rethrow;
    }
  }

  /* =============================================================== */
  /* ============================= GET ============================= */

  /// Method to return saved token
  static Future<String?> getSavedToken() async {
    try {
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(AppConstants.preferencesKeyToken);
    } catch (e){
      rethrow;
    }
  }

  /// Method to get token expiration date and time
  static Future<String?> getSavedTokenExpiration() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(AppConstants.preferencesTokenExpiration);
    } catch (e) {
      rethrow;
    }
  }

  /* ================================================================== */
  /* ============================= DELETE ============================= */

  /// Method to remove saved token
  static Future<bool> deleteSavedToken() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesKeyToken);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to remove saved token
  static Future<bool> deleteSavedTokenExpiration() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesKeyToken);
    } catch (e) {
      rethrow;
    }
  }

}