import 'package:natural_slim_flutter_library/utils/helpers/login_helper.dart';

import '../../controllers/authentication/authentication_controller.dart';
import '../../models/authentication/requests/refresh_token_request_model.dart';
import '../../models/authentication/responses/login_response_model.dart';
import '../../utils/helpers/token_helper.dart';
import '../../utils/shared_preferences/user_token_shared_preferences.dart';

/// Helper class for endpoint headers
class HttpHeaderOptionsHelper{

  /// Method to obtain the previously validated token. 
  /// In the event that the token saved in the app preferences 
  /// reaches its expiration time, it will be automatically renewed 
  /// and the new token will be returned.
  static Future<String?> getValidatedToken() async{
    try{
      bool isTokenValid = await TokenHelper.isAuthTokenValid();

      // In case the token is still valid, only the same token is returned
      if(isTokenValid){
        String? token = await UserTokenSharedPreferences.getSavedAuthToken();

        return token;
      }

      String? authToken = await UserTokenSharedPreferences.getSavedAuthToken();
      String? refreshToken = await UserTokenSharedPreferences.getSavedRefreshToken();

      RefreshTokenRequestModel requestToken = RefreshTokenRequestModel(
        authToken: authToken!, 
        refreshToken: refreshToken!
      );

      // A new login is created with the credentials from the preferences. And therefore, a new token.
      LoginResponseModel updatedLogin = await AuthenticationController().postRefreshToken(requestToken);

      bool isAuthenticationDataSaved = await LoginHelper.saveAuthenticationData(updatedLogin);

      if(!isAuthenticationDataSaved){
        throw Exception();
      }

      return updatedLogin.authToken;
    } catch(e) {
      rethrow;
    }
  }

  /// Method to get the current time zone offset.
  static String getTimeZoneOffset(){
    String timeZoneOffset = DateTime.now().timeZoneOffset.inHours.toString();

    return timeZoneOffset;
  }
}