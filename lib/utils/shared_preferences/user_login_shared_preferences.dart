import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/authentication/request/login_request_model.dart';
import 'package:natural_slim_flutter_library/utils/encryption_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginSharedPreferences {

  Future<bool> saveLoginCredentials(LoginRequest loginCredentials) async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String encryptedUsername = EncryptionManagement.encrypt(loginCredentials.username).base64;
      String encryptedPassword = EncryptionManagement.encrypt(loginCredentials.password).base64;

      if(encryptedUsername == "" || encryptedPassword == ""){
        return false;
      }

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

  Future<String> getUsername() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? usernameEncrypted = prefs.getString(ApiConstants.preferencesUsername);

      if(usernameEncrypted == null || usernameEncrypted == '') throw Exception();

      String usernameDecrypted = EncryptionManagement.decrypt(usernameEncrypted);

      return usernameDecrypted;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getPassword() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? passwordEncrypted = prefs.getString(ApiConstants.preferencesPassword);

      if(passwordEncrypted == null || passwordEncrypted == '') throw Exception();

      String passwordDecrypted = EncryptionManagement.decrypt(passwordEncrypted);

      return passwordDecrypted;
    } catch (e) {
      rethrow;
    }
  }

}