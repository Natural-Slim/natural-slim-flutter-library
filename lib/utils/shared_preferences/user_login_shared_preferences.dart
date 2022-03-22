import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/authentication/request/login_request_model.dart';
import 'package:natural_slim_flutter_library/utils/encryption_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class to handle user credentials in app preferences
class UserLoginSharedPreferences {

  /// Method to save login credentials in app preferences
  static Future<bool> saveLoginCredentials(LoginRequest loginCredentials) async{
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // User credentials are encrypted for added security
      String encryptedUsername = EncryptionManagement.encrypt(loginCredentials.username).base64;
      String encryptedPassword = EncryptionManagement.encrypt(loginCredentials.password).base64;

      if(encryptedUsername == "" || encryptedPassword == ""){
        return false;
      }

      // Credentials are saved in the app preferences
      var savedEncryptedUsername = await prefs.setString(ApiConstants.preferencesUsername, encryptedUsername);
      var savedEncryptedPassword = await prefs.setString(ApiConstants.preferencesPassword, encryptedPassword);

      if(!savedEncryptedUsername || !savedEncryptedPassword){
        return false;
      }

      return true;
    } catch (e) {
      rethrow;
    }
  }

  /// Method to get username from app preferences
  static Future<String> getUsername() async {
    try{
      // An object is created to access the app's preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Obtain the encrypted username
      String? usernameEncrypted = prefs.getString(ApiConstants.preferencesUsername);

      if(usernameEncrypted == null || usernameEncrypted == '') throw Exception();

      // The username is decrypted and returned already decrypted
      return EncryptionManagement.decrypt(usernameEncrypted);
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
      String? passwordEncrypted = prefs.getString(ApiConstants.preferencesPassword);

      if(passwordEncrypted == null || passwordEncrypted == '') throw Exception();

      // The password is decrypted and returned already decrypted
      return EncryptionManagement.decrypt(passwordEncrypted);
    } catch (e) {
      rethrow;
    }
  }

}