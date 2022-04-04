import 'package:natural_slim_flutter_library/models/authentication/requests/login_request_model.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_login_shared_preferences.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_token_shared_preferences.dart';

class LoginHelper {

  /// Method to login locally
  static Future<bool> login(LoginRequestModel loginCredentials, String token, DateTime tokenExpiration) async {

    if(!await UserLoginSharedPreferences.saveLoginCredentials(loginCredentials)) return false;

    if(!await UserTokenSharedPreferences.saveValueToken(token) || !await UserTokenSharedPreferences.saveValueTokenExpiration(tokenExpiration.toString())) {
      return false;
    }

    return true;
  }

  /// Method to know if the login is valid
  static Future<bool> isLoginValid() async {

    String? token = await UserTokenSharedPreferences.getSavedToken();
    // String username = await UserLoginSharedPreferences.getUsername();
    // String pass = await UserLoginSharedPreferences.getPassword();

    if(token == null || token == '' 
    // || username == '' || pass == ''
    ) return false;

    return true;
  }

  /// Method to log out and clear saved preferences
  static Future<bool> logout() async {
    
    if(!await UserTokenSharedPreferences.deleteSavedToken() ||
      !await UserTokenSharedPreferences.deleteSavedTokenExpiration() ||
      !await UserLoginSharedPreferences.deleteSavedUsername() ||
      !await UserLoginSharedPreferences.deleteSavedPassword())
    {
      return false;
    }

    return true;
  }

}