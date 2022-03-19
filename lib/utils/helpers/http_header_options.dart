import 'package:natural_slim_flutter_library/utils/shared_preferences/user_token_shared_preferences.dart';

class HttpHeaderOptions{
  static String getTimeZoneOffset(){
    String timeZoneOffset = DateTime.now().timeZoneOffset.inHours.toString();

    return timeZoneOffset;
  }

  static Future<String?> getToken() async {
    String? token = await UserTokenSharedPreferences().returnSavedToken();
    return token;
  }
}