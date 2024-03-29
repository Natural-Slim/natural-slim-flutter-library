import 'package:natural_slim_flutter_library/models/authentication/requests/login_request_model.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/registry_shared_preferences.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_login_shared_preferences.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_settings_shared_preferences.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_token_shared_preferences.dart';

class LoginHelper {

  /// Method to cache everything related to the login
  static Future<bool> login(LoginRequestModel loginCredentials, String token, DateTime tokenExpiration, DateTime tokenRequestDateTime) async {
    bool isLoginCredentialsSaved = await UserLoginSharedPreferences.saveLoginCredentials(loginCredentials);

    if(!isLoginCredentialsSaved) {
      return false;
    }

    bool isTokenSaved = await UserTokenSharedPreferences.saveValueToken(token);
    bool isTokenExpirationSaved = await UserTokenSharedPreferences.saveValueTokenExpiration(tokenExpiration.toIso8601String());
    bool isTokenRequestDateTimeSaved = await UserTokenSharedPreferences.saveValueTokenRequestDateTime(tokenRequestDateTime.toIso8601String());

    if(!isTokenSaved || !isTokenExpirationSaved || !isTokenRequestDateTimeSaved) {
      return false;
    }

    return true;
  }

  /// Verify that the necessary data exists in the shared preferences.
  /// If at least one does not exist, return false.
  static Future<bool> dataExistsInSharedPreferences() async {

    String? token = await UserTokenSharedPreferences.getSavedToken();
    String? username = await UserLoginSharedPreferences.getUsername();
    String? pass = await UserLoginSharedPreferences.getPassword();
    String? tokenExpiration = await UserTokenSharedPreferences.getSavedTokenExpiration();
    String? tokenRequestDateTime = await UserTokenSharedPreferences.getSavedTokenRequestDateTime();

    if((token == null || token == '') || 
      (username == null || username == '') || 
      (pass == null || pass == '') || 
      (tokenExpiration == null || tokenExpiration == '') || 
      (tokenRequestDateTime == null || tokenRequestDateTime == '')) 
    {
      return false;
    }

    return true;
  }

  /// Method to log out and clear saved preferences
  static Future<bool> logoutClearCache() async {

    bool isSavedTokenDeleted = await UserTokenSharedPreferences.deleteSavedToken();
    bool isSavedTokenExpirationDeleted = await UserTokenSharedPreferences.deleteSavedTokenExpiration();
    bool isSavedUsernameDeleted = await UserLoginSharedPreferences.deleteSavedUsername();
    bool isSavedPasswordDeleted = await UserLoginSharedPreferences.deleteSavedPassword();
    bool isSavedUserSettingsDeleted = await UserSettingsSharedPreferences.deleteUserSettings();
    bool isSavedRegistryDeleted = await RegistrySharedPreferences.deleteSavedRegistry();
    
    if(!isSavedTokenDeleted || !isSavedTokenExpirationDeleted || !isSavedUsernameDeleted || 
      !isSavedPasswordDeleted || !isSavedUserSettingsDeleted || !isSavedRegistryDeleted)
    {
      return false;
    }

    return true;
  }

}