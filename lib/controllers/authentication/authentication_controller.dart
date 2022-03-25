import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/authentication/requests/login_request_model.dart';
import 'package:natural_slim_flutter_library/models/authentication/responses/login_response_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/helpers/http_header_options_helper.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_login_shared_preferences.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_token_shared_preferences.dart';

class AuthenticationController{
  HttpRequests httpRequests = HttpRequests();
  /// Method to consult the API if the username and password is correct to be able to enter the app
  Future<LoginResponseModel> postLogin(LoginRequestModel request) async {
    try{
      Uri url = Uri.parse('${ApiConstants.url}/api/auth/login');
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.post(
        url: '${ApiConstants.baseUrl}/api/auth/login', 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
        },
        body: jsonEncode(request)
      );

      if(response.statusCode != 200){
        ExceptionsHelper.validateApiException(response);
      }

      if(!await UserLoginSharedPreferences.saveLoginCredentials(request)) throw Exception();

      LoginResponseModel parsedResponse = LoginResponseModel.fromJson(jsonDecode(response.body));

      if(!await UserTokenSharedPreferences.saveValueToken(parsedResponse.token) ||
         !await UserTokenSharedPreferences.saveValueTokenExpiration(parsedResponse.tokenExpiration.toString())) {
        throw Exception();
      }

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

}