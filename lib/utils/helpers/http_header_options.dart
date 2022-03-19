import 'package:natural_slim_flutter_library/controllers/authentication/authentication_controller.dart';
import 'package:natural_slim_flutter_library/models/authentication/request/login_request_model.dart';
import 'package:natural_slim_flutter_library/models/authentication/response/login_response_model.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_login_shared_preferences.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_token_shared_preferences.dart';

class HttpHeaderOptions{
  Future<String?> getValidatedToken() async{
    bool isTokenValid = await _isTokenValid();

    if(isTokenValid){
      String? token = await UserTokenSharedPreferences().returnSavedToken();

      return token;
    }

    String username = await UserLoginSharedPreferences().getUsername();
    String? password = await UserLoginSharedPreferences().getPassword();

    LoginRequest newLogin = LoginRequest(username: username, password: password);

    LoginResponse updatedLogin = await AuthenticationController().postLogin(newLogin);

    return updatedLogin.token;
  }

  static String getTimeZoneOffset(){
    String timeZoneOffset = DateTime.now().timeZoneOffset.inHours.toString();

    return timeZoneOffset;
  }

  static Future<String?> getToken() async {
    String? token = await UserTokenSharedPreferences().returnSavedToken();
    return token;
  }

  /* ===================================================================================== */
  /* ============================== Private methods ====================================== */
  /* ===================================================================================== */

  Future<bool> _isTokenValid() async {

    String? tokenExpiration = await UserTokenSharedPreferences().getSavedTokenExpiration();

    if(tokenExpiration == null || tokenExpiration == '') return false;

    DateTime currentDate = DateTime.now();

    DateTime parsedTokenExpiration = DateTime.parse(tokenExpiration);
    DateTime parsedUtcCurrentDate = DateTime.utc(currentDate.year, currentDate.month, currentDate.day, currentDate.hour, currentDate.minute);
    
    return parsedUtcCurrentDate.isBefore(parsedTokenExpiration) ? true : false;
  }
}