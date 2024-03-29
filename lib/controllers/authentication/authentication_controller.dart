import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:natural_slim_flutter_library/constants/api_constants.dart';
import 'package:natural_slim_flutter_library/models/authentication/requests/login_request_model.dart';
import 'package:natural_slim_flutter_library/models/authentication/requests/user_profile_information_request_model.dart';
import 'package:natural_slim_flutter_library/models/authentication/responses/login_response_model.dart';
import 'package:natural_slim_flutter_library/models/authentication/responses/user_profile_information_response_model.dart';
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
          'Accept': 'application/json',
          'x-Time-Zone': timeZone,
          'Language': language,
        },
        body: jsonEncode(request)
      );

      if(response.statusCode != 200){
        ExceptionsHelper.validateApiException(response);
      }

      LoginResponseModel parsedResponse = LoginResponseModel.fromJson(jsonDecode(response.body));

      DateTime currentDate = DateTime.now();
      DateTime tokenExpiration = currentDate.add(Duration(minutes: parsedResponse.tokenExpiration));

      if(!await LoginHelper.login(request, parsedResponse.token, tokenExpiration, currentDate)) throw Exception();

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

  /// Method to consult the API if the username and password is correct to be able to enter the app
  Future<UserProfileInformationResponseModel> getUserProfileInformation() async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.get(
        url: '${apiConstants.baseUrl}/api/auth/user', 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
      );

      if(response.statusCode != 200){
        ExceptionsHelper.validateApiException(response);
      }

      UserProfileInformationResponseModel parsedResponse = UserProfileInformationResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

  /// Method to consult the API if the username and password is correct to be able to enter the app
  Future<UserProfileInformationResponseModel> putUserProfileInformation(UserProfileInformationRequestModel userInformation) async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.put(
        url: '${apiConstants.baseUrl}/api/auth/user',
        body: jsonEncode(userInformation),
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
      );

      if(response.statusCode != 200){
        ExceptionsHelper.validateApiException(response);
      }

      UserProfileInformationResponseModel parsedResponse = UserProfileInformationResponseModel.fromJson(jsonDecode(response.body));

      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

  /// Method to log out of the API
  Future<bool> postLogout() async {
    try{
      String? token = await HttpHeaderOptionsHelper.getValidatedToken();
      String timeZone = HttpHeaderOptionsHelper.getTimeZoneOffset();

      http.Response response = await httpRequests.post(
        url: '${apiConstants.baseUrl}/api/auth/logout', 
        headers: {
          'Content-Type':'application/json',
          'x-Time-Zone': timeZone,
          'Authorization':'Bearer $token'
        },
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