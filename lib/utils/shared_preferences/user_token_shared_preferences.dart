import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTokenSharedPreferences {

  /// Method to save token
  Future<bool> saveValueToken(String token) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool saveStatus = await prefs.setString(ApiConstants.preferencesKeyToken, token);

      return saveStatus;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> saveValueTokenExpiration(String tokenExpiration) async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool saveStatus = await prefs.setString(ApiConstants.preferencesTokenExpiration, tokenExpiration);

      return saveStatus;
    } catch (e) {
      rethrow;
    }
  }

  // Method to return saved token
  Future<String?> returnSavedToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(ApiConstants.preferencesKeyToken);

      return token;
    } catch (e){
      rethrow;
    }
  }

  Future<String?> getSavedTokenExpiration() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenExpiration = prefs.getString(ApiConstants.preferencesTokenExpiration);

      return tokenExpiration;
    } catch (e) {
      rethrow;
    }
  }

  // Method to remove saved token
  Future<bool> removeSavedToken() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool removalStatus = await prefs.remove(ApiConstants.preferencesKeyToken);

      return removalStatus;
    } catch (e) {
      rethrow;
    }
  }

}