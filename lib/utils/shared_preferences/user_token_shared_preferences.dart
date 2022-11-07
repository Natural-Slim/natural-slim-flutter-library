import 'package:natural_slim_flutter_library/constants/app_constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class to handle login token in app preferences
class UserTokenSharedPreferences {

  /* =============================================================== */
  /* ============================= SET ============================= */

  /// Method to save auth token
  static Future<bool> saveValueAuthToken(String authToken) async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setString(AppConstants.preferencesAuthToken, authToken);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to save refresh token
  static Future<bool> saveValueRefreshToken(String refreshToken) async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setString(AppConstants.preferencesRefreshToken, refreshToken);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to save auth token expiration date and time
  static Future<bool> saveValueAuthTokenExpiration(String authTokenExpiration) async{
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setString(AppConstants.preferencesAuthTokenExpiration, authTokenExpiration);
    } catch (e) {
      rethrow;
    }
  }
  
  /// Method to save refresh token expiration date and time
  static Future<bool> saveValueRefreshTokenExpiration(String refreshTokenExpiration) async{
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setString(AppConstants.preferencesRefreshTokenExpiration, refreshTokenExpiration);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to save the date and time of the request for new tokens
  static Future<bool> saveValueTokenRequestDateTime(String tokenRequestDateTime) async{
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setString(AppConstants.preferencesTokenRequestDateTime, tokenRequestDateTime);
    } catch (e) {
      rethrow;
    }
  }

  /* =============================================================== */
  /* ============================= GET ============================= */

  /// Method to return saved auth token
  static Future<String?> getSavedAuthToken() async {
    try {
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(AppConstants.preferencesAuthToken);
    } catch (e){
      rethrow;
    }
  }

  /// Method to get auth token expiration date and time
  static Future<String?> getSavedAuthTokenExpiration() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(AppConstants.preferencesAuthTokenExpiration);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to return saved refresh token
  static Future<String?> getSavedRefreshToken() async {
    try {
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(AppConstants.preferencesRefreshToken);
    } catch (e){
      rethrow;
    }
  }

  /// Method to get refresh token expiration date and time
  static Future<String?> getSavedRefreshTokenExpiration() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(AppConstants.preferencesRefreshTokenExpiration);
    } catch (e) {
      rethrow;
    }
  }
  
  /// Method to get token request date
  static Future<String?> getSavedTokenRequestDateTime() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(AppConstants.preferencesTokenRequestDateTime);
    } catch (e) {
      rethrow;
    }
  }

  /* ================================================================== */
  /* ============================= DELETE ============================= */

  /// Method to remove saved auth token
  static Future<bool> deleteSavedAuthToken() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesAuthToken);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to remove saved auth token expiration
  static Future<bool> deleteSavedAuthTokenExpiration() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesAuthTokenExpiration);
    } catch (e) {
      rethrow;
    }
  }
  
  /// Method to remove saved refresh token
  static Future<bool> deleteSavedRefreshToken() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesRefreshToken);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to remove saved refresh token expiration
  static Future<bool> deleteSavedRefreshTokenExpiration() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesRefreshTokenExpiration);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to remove saved auth token request date
  static Future<bool> deleteSavedAuthTokenRequestDateTime() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesTokenRequestDateTime);
    } catch (e) {
      rethrow;
    }
  }

}