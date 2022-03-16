import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {

  /// Methos to save token
  Future<bool> saveValueToken(String token) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var saveStatus = await prefs.setString('token', token);
      return saveStatus;
    } catch (e) {
      rethrow;
    }
  }

  // Method to return saved token
  Future<String?> returnSavedToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(ApiConstants.preferencesKeyToken);
      return token;
    } catch (e){
      rethrow;
    }
  }

}