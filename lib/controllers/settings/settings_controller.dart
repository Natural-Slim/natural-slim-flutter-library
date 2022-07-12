import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/settings/response/user_settings_response_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/helpers/http_header_options_helper.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';

class SettingsController{
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();
  
  /// Method to get current user settings
  Future<UserSettingsResponseModel> getUserSettings() async{
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/settings/user-settings',
        headers: {
          'Content-Type': 'application/json',
          'x-Time-Zone': timeZone,
          'Authorization': 'Bearer $token'
        }
      );

      if(response.statusCode != 200) {
        ExceptionsHelper.validateApiException(response);
      }

      UserSettingsResponseModel parsedResponse = UserSettingsResponseModel.fromJson(jsonDecode(response.body));
      return parsedResponse;

    } catch (e) {
      rethrow;
    }
  }
}