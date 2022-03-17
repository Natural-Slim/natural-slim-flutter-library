import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:natural_slim_flutter_library/constants/api_constants.dart';

import 'package:natural_slim_flutter_library/models/authentication/request/login_request_model.dart';
import 'package:natural_slim_flutter_library/models/authentication/response/login_response_model.dart';
import 'package:natural_slim_flutter_library/utils/exceptions_helper.dart';
import 'package:natural_slim_flutter_library/utils/shared_preferences/user_login_shared_preferences.dart';

class AuthenticationController{

  /// Method to consult the API if the username and password is correct to be able to enter the app
  Future<LoginResponse> postLogin(LoginRequest request) async {
    try{
      Uri url = Uri.parse('${ApiConstants.url}/api/auth/login');

      http.Response response = await http.post(
        url, 
        headers: {
          'Content-Type':'application/json',
        },
        body: jsonEncode(request)
      );

      if(response.statusCode != 200){
        ExceptionsHelper.validateApiException(response);
      }

      if(!await UserLoginSharedPreferences().saveLoginCredentials(request)){
        throw Exception();
      }

      LoginResponse parsedResponse = LoginResponse.fromJson(jsonDecode(response.body));
      return parsedResponse;
        
    } catch (e){
      rethrow;
    }
  }

}