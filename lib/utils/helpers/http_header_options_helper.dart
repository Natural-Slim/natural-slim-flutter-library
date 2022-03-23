import 'package:natural_slim_flutter_library/controllers/authentication/authentication_controller.dart';
import 'package:natural_slim_flutter_library/models/authentication/requests/login_request_model.dart';
import 'package:natural_slim_flutter_library/models/authentication/responses/login_response_model.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_login_shared_preferences.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_token_shared_preferences.dart';

/// Helper class for endpoint headers
class HttpHeaderOptionsHelper{

  /// Method to obtain the previously validated token. 
  /// In the event that the token saved in the app preferences 
  /// reaches its expiration time, it will be automatically renewed 
  /// and the new token will be returned.
  static Future<String?> getValidatedToken() async{
    bool isTokenValid = await _isTokenValid();

    // In case the token is still valid, only the same token is returned
    if(isTokenValid){
      return await UserTokenSharedPreferences.getSavedToken();
    }

    // The credentials saved in the app preferences are obtained
    String username = await UserLoginSharedPreferences.getUsername();
    String password = await UserLoginSharedPreferences.getPassword();

    // A new login is created with the credentials from the preferences. And therefore, a new token.
    LoginResponseModel updatedLogin = await AuthenticationController().postLogin(LoginRequestModel(username: username, password: password));

    return updatedLogin.token;
  }

  /// Method to get the current time zone offset.
  static String getTimeZoneOffset(){
    String timeZoneOffset = DateTime.now().timeZoneOffset.inHours.toString();

    return timeZoneOffset;
  }

  /* ===================================================================================== */
  /* ============================== Private methods ====================================== */
  /* ===================================================================================== */

  /// Private method to check if token saved in preferences is valid or not
  static Future<bool> _isTokenValid() async {

    // The expiration date of the token saved in the preferences is obtained
    String? tokenExpiration = await UserTokenSharedPreferences.getSavedTokenExpiration();

    if(tokenExpiration == null || tokenExpiration == '') return false;

    // Convert the expiration date to a DateTime object
    DateTime parsedTokenExpiration = DateTime.parse(tokenExpiration);

    // Get the current date and time and convert it to a DateTime object with UTC0
    DateTime currentDate = DateTime.now();
    DateTime parsedUtcCurrentDate = DateTime.utc(currentDate.year, currentDate.month, currentDate.day, currentDate.hour, currentDate.minute);
    
    return parsedUtcCurrentDate.isBefore(parsedTokenExpiration) ? true : false;
  }
}