import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTokenSharedPreferences {

  /// Methos to save token
  Future<bool> saveValueToken(String token) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool saveStatus = await prefs.setString('token', token);
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