import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {

  Future<bool> saveValueToken(String token) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var saveStatus = await prefs.setString('token', token);
      return saveStatus;
    } catch (e) {
      rethrow;
    }
  }

}