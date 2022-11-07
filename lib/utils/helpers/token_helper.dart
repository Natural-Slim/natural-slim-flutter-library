import '../shared_preferences/user_token_shared_preferences.dart';

class TokenHelper {

  /// Check if  token auth saved in preferences is valid or not
  static Future<bool> isAuthTokenValid() async {
    try {
        // The expiration date of the auth token saved in the preferences is obtained
      String? authTokenExpiration = await UserTokenSharedPreferences.getSavedAuthTokenExpiration();
      String? tokenRequestDateTime = await UserTokenSharedPreferences.getSavedTokenRequestDateTime();

      if((authTokenExpiration == null || authTokenExpiration == '') || 
        (tokenRequestDateTime == null || tokenRequestDateTime == '')) {

        return false;
      }

      // Convert the expiration date to a DateTime object
      DateTime parsedAuthTokenExpiration = DateTime.parse(authTokenExpiration);
      DateTime parsedTokenRequestDateTime = DateTime.parse(tokenRequestDateTime);

      // Get the current date and time
      DateTime currentDate = DateTime.now();
      DateTime currentDateMoreSeconds = currentDate.add(const Duration(seconds: 20));

      bool forwardDateComparison = currentDateMoreSeconds.isBefore(parsedAuthTokenExpiration);
      bool backwardDateComparison = currentDate.isBefore(parsedTokenRequestDateTime);

      if(forwardDateComparison && !backwardDateComparison){
        return true;
      }
      
      return false;

    } catch(e) {
      rethrow;
    }
  }

  /// Check if refresh token saved in preferences is valid or not
  static Future<bool> isRefreshTokenValid() async {
    try {
      
      // The expiration date of the token saved in the preferences is obtained
      String? refreshTokenExpiration = await UserTokenSharedPreferences.getSavedRefreshTokenExpiration();
      String? tokenRequestDateTime = await UserTokenSharedPreferences.getSavedTokenRequestDateTime();

      if((refreshTokenExpiration == null || refreshTokenExpiration == '') || 
        (tokenRequestDateTime == null || tokenRequestDateTime == '')) {

        return false;
      }

      // Convert the expiration date to a DateTime object
      DateTime parsedAuthTokenExpiration = DateTime.parse(refreshTokenExpiration);
      DateTime parsedTokenRequestDateTime = DateTime.parse(tokenRequestDateTime);

      // Get the current date and time
      DateTime currentDate = DateTime.now();
      DateTime currentDateMoreDays = currentDate.add(const Duration(days: 1));

      bool forwardDateComparison = currentDateMoreDays.isBefore(parsedAuthTokenExpiration);
      bool backwardDateComparison = currentDate.isBefore(parsedTokenRequestDateTime);

      if(forwardDateComparison && !backwardDateComparison){
        return true;
      }
      
      return false;

    } catch(e) {
      rethrow;
    }
  }

}