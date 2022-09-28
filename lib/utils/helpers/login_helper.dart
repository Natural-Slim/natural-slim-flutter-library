import '../../models/authentication/requests/login_request_model.dart';
import '../../models/authentication/responses/login_response_model.dart';
import '../shared_preferences/registry_shared_preferences.dart';
import '../shared_preferences/user_token_shared_preferences.dart';
import '../shared_preferences/user_settings_shared_preferences.dart';

class LoginHelper {

  /// Method to cache everything related to the login
  static Future<bool> saveAuthenticationData(LoginResponseModel responseLogin, [LoginRequestModel? loginCredentials]) async {
    try{

      // The expiration times of the tokens and the time of the request are calculated
      DateTime currentDate = DateTime.now();
      DateTime authTokenExpiration = currentDate.add(Duration(minutes: responseLogin.authTokenExpirationInMin));
      DateTime refreshTokenExpiration = currentDate.add(Duration(days: responseLogin.refreshTokenExpirationInDays));

      bool isAuthTokenSaved = await UserTokenSharedPreferences.saveValueAuthToken(responseLogin.authToken);
      bool isAuthTokenExpirationSaved = await UserTokenSharedPreferences.saveValueAuthTokenExpiration(authTokenExpiration.toIso8601String());
      bool isRefreshTokenSaved = await UserTokenSharedPreferences.saveValueRefreshToken(responseLogin.refreshToken);
      bool isRefreshTokenExpirationSaved = await UserTokenSharedPreferences.saveValueRefreshTokenExpiration(refreshTokenExpiration.toIso8601String());
      bool isTokenRequestDateTimeSaved = await UserTokenSharedPreferences.saveValueTokenRequestDateTime(currentDate.toIso8601String());

      if(!isAuthTokenSaved || !isAuthTokenExpirationSaved || !isTokenRequestDateTimeSaved || !isRefreshTokenSaved || !isRefreshTokenExpirationSaved) {
        return false;
      }

      return true;

    } catch(e) {
      rethrow;
    }
  }

  /// Verify that the necessary data exists in the shared preferences.
  /// If at least one does not exist, return false.
  static Future<bool> dataExistsInSharedPreferences() async {
    try{

      // String? username = await UserLoginSharedPreferences.getUsername();
      // String? pass = await UserLoginSharedPreferences.getPassword();
      String? authToken = await UserTokenSharedPreferences.getSavedAuthToken();
      String? authTokenExpiration = await UserTokenSharedPreferences.getSavedAuthTokenExpiration();
      String? refreshToken = await UserTokenSharedPreferences.getSavedRefreshToken();
      String? refreshTokenExpiration = await UserTokenSharedPreferences.getSavedRefreshTokenExpiration();
      String? tokenRequestDateTime = await UserTokenSharedPreferences.getSavedTokenRequestDateTime();

      if((authToken == null || authToken == '') || 
        (authTokenExpiration == null || authTokenExpiration == '') || 
        (refreshToken == null || refreshToken == '') ||
        (refreshTokenExpiration == null || refreshTokenExpiration == '') ||
        (tokenRequestDateTime == null || tokenRequestDateTime == '')) {

        return false;
      }

      return true;

    } catch(e) {
      rethrow;
    }
  }

  /// Method to log out and clear saved preferences
  static Future<bool> logoutClearCache() async {
    try{
      
      bool isSavedTokenDeleted = await UserTokenSharedPreferences.deleteSavedAuthToken();
      bool isSavedTokenExpirationDeleted = await UserTokenSharedPreferences.deleteSavedAuthTokenExpiration();
      bool isSavedUserSettingsDeleted = await UserSettingsSharedPreferences.deleteUserSettings();
      bool isSavedRegistryDeleted = await RegistrySharedPreferences.deleteSavedRegistry();
      
      if(!isSavedTokenDeleted || !isSavedTokenExpirationDeleted || 
         !isSavedUserSettingsDeleted || !isSavedRegistryDeleted)
      {
        return false;
      }

      return true;

    } catch(e) {
      rethrow;
    }
  }

}