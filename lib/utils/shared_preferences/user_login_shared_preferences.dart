import 'package:natural_slim_flutter_library/constants/app_constans.dart';
import 'package:natural_slim_flutter_library/models/authentication/requests/login_request_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/encryption_management_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class to handle user credentials in app preferences
class UserLoginSharedPreferences {

  /* =============================================================== */
  /* ============================= SET ============================= */

  /// Method to save login credentials in app preferences
  static Future<bool> saveLoginCredentials(LoginRequestModel loginCredentials) async{
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // User credentials are encrypted for added security
      String encryptedUsername = EncryptionManagementHelper.encrypt(loginCredentials.username).base64;
      String encryptedPassword = EncryptionManagementHelper.encrypt(loginCredentials.password).base64;

      if(encryptedUsername == "" || encryptedPassword == ""){
        return false;
      }

      // Credentials are saved in the app preferences
      var savedEncryptedUsername = await prefs.setString(AppConstants.preferencesUsername, encryptedUsername);
      var savedEncryptedPassword = await prefs.setString(AppConstants.preferencesPassword, encryptedPassword);

      if(!savedEncryptedUsername || !savedEncryptedPassword){
        return false;
      }

      return true;
    } catch (e) {
      rethrow;
    }
  }

  /* =============================================================== */
  /* ============================= GET ============================= */

  /// Method to get username from app preferences
  static Future<String> getUsername() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Obtain the encrypted username
      String? usernameEncrypted = prefs.getString(AppConstants.preferencesUsername);

      if(usernameEncrypted == null || usernameEncrypted == '') throw Exception();

      // The username is decrypted and returned already decrypted
      return EncryptionManagementHelper.decrypt(usernameEncrypted);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to obtain the password from the app preferences
  static Future<String> getPassword() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Obtain the encrypted password
      String? passwordEncrypted = prefs.getString(AppConstants.preferencesPassword);

      if(passwordEncrypted == null || passwordEncrypted == '') throw Exception();

      // The password is decrypted and returned already decrypted
      return EncryptionManagementHelper.decrypt(passwordEncrypted);
    } catch (e) {
      rethrow;
    }
  }

  /* ================================================================== */
  /* ============================= DELETE ============================= */

  /// Method to remove saved username
  static Future<bool> deleteSavedUsername() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesUsername);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to remove saved password
  static Future<bool> deleteSavedPassword() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(AppConstants.preferencesPassword);
    } catch (e) {
      rethrow;
    }
  }
}