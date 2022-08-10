import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/authentication/requests/login_request_model.dart';
import 'package:natural_slim_flutter_library/models/authentication/responses/login_response_model.dart';
import 'package:natural_slim_flutter_library/utils/helpers/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/helpers/http_header_options_helper.dart';
import 'package:natural_slim_flutter_library/utils/helpers/login_helper.dart';
import 'package:natural_slim_flutter_library/utils/http_requests/http_requests.dart';

class AuthenticationController{
  HttpRequests httpRequests = HttpRequests();
  static ApiConstants apiConstants = ApiConstants();

  /// Method to consult the API if the username and password is correct to be able to enter the app
  Future<LoginResponseModel> postLogin(LoginRequestModel request, [String language = 'es']) async {
    try{
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.post(
        url: '${apiConstants.baseUrl}/api/auth/login', 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Language': language,
        },
        body: jsonEncode(request)
      );

      if(response.statusCode != 200){
        ExceptionsHelper.validateApiException(response);
      }

      LoginResponseModel parsedResponse = LoginResponseModel.fromJson(jsonDecode(response.body));

      if(!await LoginHelper.login(request, parsedResponse.token, parsedResponse.tokenExpiration)) throw Exception();

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

  /// Method to send password reset email
  Future<bool> postResetPasswordToken(String email, [String language = 'es']) async {
    try{
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.post(
        url: '${apiConstants.baseUrl}/api/auth/reset-password-token', 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Language': language,
        },
        body: jsonEncode({"email": email})
      );

      if(response.statusCode != 200){
        ExceptionsHelper.validateApiException(response);
      }

      return true;
        
    } catch (e){
      rethrow;
    }
  }

}